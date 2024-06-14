//
//  ContentView.swift
//  CameraApp
//
//  Created by Scholar on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedImage: UIImage?
    @State var isImagePickerShowing = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage(named: "Camera")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Button("Select a Photo") {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                }
                Button("Take a Photo") {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                }
            }
        }
        .sheet(isPresented: $isImagePickerShowing, content: {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
