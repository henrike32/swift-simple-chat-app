//
//  ContentView.swift
//  SimpleChat
//
//  Created by LEARN Academy on 7/16/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
	@State private var newMessage = ""
	@State private var messages = [String]()
	
	var body: some View {
		VStack {
			List(messages, id: \.self) { message in
				Text(message)
			}
			
			HStack {
				TextField("Message...", text: $newMessage)
					.textFieldStyle(RoundedBorderTextFieldStyle())
				
				Button(action: sendMessage) {
					Text("Send")
				}
			}.padding()
		}.onAppear {
			signInAnonymously()
			fetchMessages()
		}
	}
	
	func sendMessage() {
		guard !newMessage.isEmpty, let userID = Auth.auth().currentUser?.uid else {
			return
		}
		
		let db = Firestore.firestore()
		
		db.collection("messages").addDocument(data: [
			"text": newMessage,
			"userID": userID,
			"timestamp": Date()
		]) { error in
			if let error = error {
				print("Failed to add message: \(error.localizedDescription)")
			} else {
				print("Message added.")
			}
		}
		
		newMessage = ""
	}
	
	func signInAnonymously() {
		Auth.auth().signInAnonymously() { (authResult, error) in
			if let error = error {
				print("Authentication failed with error: \(error.localizedDescription)")
			} else {
				print("Successfully authenticated with uid: \(authResult?.user.uid ?? "")")
			}
		}
	}
	
	func fetchMessages() {
		let db = Firestore.firestore()
		db.collection("messages")
			.order(by: "timestamp")
			.addSnapshotListener { querySnapshot, error in
				if let error = error {
					print("Error getting messages: \(error.localizedDescription)")
				} else {
					self.messages = querySnapshot?.documents.compactMap { document in
						document.data()["text"] as? String
					} ?? []
				}
			}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
