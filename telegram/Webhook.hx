package telegram;

import js.node.Fs;
import js.node.Http;
import js.node.Https;
import js.node.http.ServerResponse;
import js.node.events.EventEmitter;

import telegram.Types;

class Webhook extends EventEmitter {

  var path: String;
  var port: Int;
  var key:  String;
  var crt:  String;

  public function new(path: String, ?port: Int = 443, key: String, crt: String) {
    this.path = path;
    this.port = port;
    this.key = key;
    this.crt = crt;
  }

  public function start():Bool {
    if (key == null || crt == null) return false;
    Https.createServer({
      key:  Fs.readFileSync(key).toString(),
      cert: Fs.readFileSync(crt).toString()
    }, webhookHandler.bind(_, _, processUpdate)).listen(port);
    return true;
  }

  function webhookHandler(req: HttpServerReq, res: ServerResponse, process: Dynamic->Void) {
    if (req.url == '/$path') {
      var buffer: String = '';
      req.setEncoding('utf8');
      req.on('data', function (chunk: String) {
        buffer += chunk
      });
      req.on('end', function(_) {
        var upd = try {
          haxe.Json.parse(buffer);
        } catch (e: js.Error) {
          res.statusCode = 400;
          return res.end('Error: ' + e.message);
        }
        process(upd);
        res.end();
        return;
      });
      req.on('error', function(err) {
        return res.end('Error: ' + err);
      });
    } else {
      res.writeHead(404);
      res.end('Page not found');
    }
  }

  function processUpdate(upd: Update):Void {
    if (upd == null || upd.message == null) return;

    if (Reflect.hasField(data.message, 'text')) this.emit('text', data.message);
    if (Reflect.hasField(data.message, 'photo')) this.emit('photo', data.message);
    if (Reflect.hasField(data.message, 'video')) this.emit('video', data.message);
    if (Reflect.hasField(data.message, 'audio')) this.emit('audio', data.message);
    if (Reflect.hasField(data.message, 'voice')) this.emit('voice', data.message);
    if (Reflect.hasField(data.message, 'sticker')) this.emit('sticker', data.message);
    if (Reflect.hasField(data.message, 'contact')) this.emit('contact', data.message);
    if (Reflect.hasField(data.message, 'document')) this.emit('document', data.message);
    if (Reflect.hasField(data.message, 'location')) this.emit('location', data.message);
    if (Reflect.hasField(data.message, 'location')) this.emit('location', data.message);
    if (Reflect.hasField(data.message, 'new_chat_title')) this.emit('newChatTitle', data.message);
    if (Reflect.hasField(data.message, 'new_chat_photo')) this.emit('newChatPhoto', data.message);
    if (Reflect.hasField(data.message, 'delete_chat_photo')) this.emit('deleteChatPhoto', data.message);
    if (Reflect.hasField(data.message, 'group_chat_created')) this.emit('groupChatCreated', data.message);
    if (Reflect.hasField(data.message, 'migrate_to_chat_id')) this.emit('migrateToChatId', data.message);
    if (Reflect.hasField(data.message, 'migrate_from_chat_id')) this.emit('migrateFromChatId', data.message);
    if (Reflect.hasField(data.message, 'channel_chat_created')) this.emit('channelChatCreated', data.message);
    if (Reflect.hasField(data.message, 'new_chat_participant')) this.emit('newChatParticipant', data.message);
    if (Reflect.hasField(data.message, 'left_chat_participant')) this.emit('leftChatParticipant', data.message);
    if (Reflect.hasField(data.message, 'supergroup_chat_created')) this.emit('supergroupChatCreated', data.message);
  }
}