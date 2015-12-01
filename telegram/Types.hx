package telegram;

typedef User = {
  id: Int,                          // Unique identifier for this user or bot
  first_name: String,               // User‘s or bot’s first name
  ?last_name: String,               // Optional. User‘s or bot’s last name
  ?username: String                 // Optional. User‘s or bot’s username
}

typedef Chat = {
  id: Int,                          // Unique identifier for this chat, not exceeding 1e13 by absolute value
  type: String,                     // Type of chat, can be either “private”, or “group”, or “channel”
  ?title: String,                   // Optional. Title, for channels and group chats
  ?username: String,                // Optional. Username, for private chats and channels if available
  ?first_name: String,              // Optional. First name of the other party in a private chat
  ?last_name: String                // Optional. Last name of the other party in a private chat
}

typedef Message = {
  message_id: Int,                  // Unique message identifier
  ?from: User,                      // Optional. Sender, can be empty for messages sent to channels
  date: Int,                        // Date the message was sent in Unix time
  chat: Chat,                       // Conversation the message belongs to
  ?forward_from: User,              // Optional. For forwarded messages, sender of the original message
  ?forward_date: Int,               // Optional. For forwarded messages, date the original message was sent in Unix time
  ?reply_to_message: Message,       // Optional. For replies, the original message.
  ?text: String,                    // Optional. For text messages, the actual UTF-8 text of the message
  ?audio: Audio,                    // Optional. Message is an audio file, information about the file
  ?document: Document,              // Optional. Message is a general file, information about the file
  ?photo: Photo,                    // Optional. Message is a photo, available sizes of the photo
  ?sticker: Sticker,                // Optional. Message is a sticker, information about the sticker
  ?video: Video,                    // Optional. Message is a video, information about the video
  ?voice: Voice,                    // Optional. Message is a voice message, information about the file
  ?caption: String,                 // Optional. Caption for the photo or video
  ?contact: Contact,                // Optional. Message is a shared contact, information about the contact
  ?location: Location,              // Optional. Message is a shared location, information about the location
  ?new_chat_participant: User,      // Optional. A new member was added to the group, information about them
  ?left_chat_participant: User,     // Optional. A member was removed from the group, information about them
  ?new_chat_title: String,          // Optional. A chat title was changed to this value
  ?new_chat_photo: Photo,           // Optional. A chat photo was change to this value
  ?delete_chat_photo: Bool,         // Optional. Informs that the chat photo was deleted
  ?group_chat_created: Bool,        // Optional. Informs that the group has been created
  ?supergroup_chat_created: Bool,   // Optional. Informs that the supergroup has been created
  ?channel_chat_created: Bool,      // Optional. Informs that the channel has been created
  ?migrate_to_chat_id: Int,         // Optional. The chat has been migrated to a chat with specified identifier
  ?migrate_from_chat_id: Int        // Optional. The chat has been migrated from a chat with specified identifier
}

typedef PhotoSize = {
  file_id: String,                  // Unique identifier for this file
  width: Int,                       // Photo width
  height: Int,                      // Photo height
  ?file_size: Int                   // Optional. File size
}

typedef Update = {
  update_id: Int,                   // The update‘s unique identifier.
  ?message: Message                 // Optional. New incoming message of any kind — text, photo, sticker, etc.
}

typedef Audio = {
  file_id: String,                  // Unique identifier for this file
  duration: Int,                    // Duration of the audio in seconds as defined by sender
  ?performer: String,               // Optional. Performer of the audio as defined by sender or by audio tags
  ?title: String,                   // Optional. Title of the audio as defined by sender or by audio tags
  ?mime_type: String,               // Optional. MIME type of the file as defined by sender
  ?file_size: Int                   // Optional. File size
}

typedef Document = {
  file_id: String,                  // Unique file identifier
  ?thumb: PhotoSize,                // Optional. Document thumbnail as defined by sender
  ?file_name: String,               // Optional. Original filename as defined by sender
  ?mime_type: String,               // Optional. MIME type of the file as defined by sender
  ?file_size: Int                   // Optional. File size
}

typedef Sticker = {
  file_id: String,                  // Unique identifier for this file
  width: Int,                       // Sticker width
  height: Int,                      // Sticker height
  ?thumb: PhotoSize,                // Optional. Sticker thumbnail in .webp or .jpg format
  ?file_size: Int                   // Optional. File size
}

typedef Video = {
  file_id: String,                  // Unique identifier for this file
  width: Int,                       // Video width as defined by sender
  height: Int,                      // Video height as defined by sender
  duration: Int,                    // Duration of the video in seconds as defined by sender
  ?thumb: PhotoSize,                // Optional. Video thumbnail
  ?mime_type: String,               // Optional. Mime type of a file as defined by sender
  ?file_size: Int                   // Optional. File size
}

typedef Voice = {
  file_id: String,                  // Unique identifier for this file
  duration: Int,                    // Duration of the audio in seconds as defined by sender
  ?mime_type: String,               // Optional. MIME type of the file as defined by sender
  ?file_size: Int                   // Optional. File size
}

typedef Contact = {
  phone_number: String,             // Contact's phone number
  first_name: String,               // Contact's first name
  ?last_name: String,               // Optional. Contact's last name
  ?user_id: Int                     // Optional. Contact's user identifier in Telegram
}

typedef Location = {
  longitude: Float,                 // Longitude as defined by sender
  latitude: Float                   // Latitude as defined by sender
}

typedef UserProfilePhotos = {
  total_count: Int,                 // Total number of profile pictures the target user has
  photos: Array<Photo>              // Requested profile pictures (in up to 4 sizes each)
}

typedef File = {
  file_id: String,                  // Unique identifier for this file
  ?file_size: Int,                  // Optional. File size, if known
  ?file_path: String                // Optional. File path.
}

typedef ReplyKeyboardMarkup = {
  keyboard: Keyboard,               // Array of button rows, each represented by an Array of Strings
  ?resize_keyboard: Bool,           // Optional. Requests clients to resize the keyboard vertically for optimal fit
  ?one_time_keyboard: Bool,         // Optional. Requests clients to hide the keyboard as soon as it's been used. Defaults to false.
  ?selective: Bool                  // Optional. Use this parameter if you want to show the keyboard to specific users only.
}

typedef ReplyKeyboardHide = {
  hide_keyboard: Bool,              // Requests clients to hide the custom keyboard
  ?selective: Bool                  // Optional. Use this parameter if you want to hide keyboard for specific users only.
}

typedef ForceReply = {
  force_reply: Bool,                // Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
  ?selective: Bool                  // Optional. Use this parameter if you want to force reply from specific users only.
}

typedef Photo = Array<PhotoSize>;

typedef Keyboard = Array<Array<String>>;

class Types {}