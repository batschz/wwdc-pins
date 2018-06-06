//
//  ConversationViewController.swift
//  Pins
//
//  Created by Werner Huber on 04.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import MessageKit

class ConversationViewController: MessagesViewController {

    var messages: [Message] = []
    var conversation: Conversation? = nil {
        didSet {
            guard conversation != nil else {
                return
            }
            loadMessages()
        }
    }
    
    let conversationService = ConversationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        loadConversation()
        
    }
    
    private func loadMessages() {
        guard let conversation = conversation else {
            return
        }
        conversationService.messagesOf(conversation: conversation) { messages in
            self.messages = messages
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToBottom(animated: true)
        }
    }
    
    private func loadConversation() {
        conversationService.conversationWith(user: "franz") { conversation in
            guard let _ = conversation else {
                self.conversationService.startConversationWith(user: "franz", completion: { conversation in
                    guard let _ = conversation else {
                        return
                    }
                    self.conversation = conversation
                })
                return
            }
            self.conversation = conversation
        }
    }

}

extension Message: MessageType {
    var messageId: String {
        return uid
    }
    var sentDate: Date {
        return createdAt
    }
    var data: MessageData {
        return MessageData.text(content)
    }
    var sender: Sender {
        return Sender(id: sentBy, displayName: "")
    }
}

extension ConversationViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 10
    }
    
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize.zero
    }
    
}

extension ConversationViewController: MessageInputBarDelegate {
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        print (text)
        guard let conversation = conversation else {
            return
        }
        conversationService.send(message: text, inConversation: conversation) { success in
            
        }
    }
}

extension ConversationViewController: MessagesDataSource {
    
    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }
    
    func currentSender() -> Sender {
        guard let me = UserService().me else {
            return Sender(id: "", displayName: "")
        }
        return Sender(id: me, displayName: "")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
}
