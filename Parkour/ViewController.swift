//
//  ViewController.swift
//  Parkour
//
//  Created by Romzeer on 06/02/2018.
//  Copyright © 2018 Romzeeer. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit






class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ValidAccountButton: UIButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var facebookLogin: FBSDKLoginButton!
    
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self

        let colors = Colors()
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    

        // Do any additional setup after loading the view, typically from a nib.
        //ValidAccountButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        ValidAccountButton.layer.cornerRadius = 0.5 * ValidAccountButton.bounds.size.width
        ValidAccountButton.clipsToBounds = true
        
    }
    
    
    
    //Called when the user created his account
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            // ...
        }
    }
    
    //Called when a user log with email and password
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
                // ...
            }
        }
    }
    
    //Called when user press the google sign in button
    @IBAction func signInGoogleAction(_ sender: Any) {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func logOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
   @IBAction func signInFbAction(_ sender: Any) {
    
    let fbLoginManager = FBSDKLoginManager()
    fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
        if let error = error {
            print("Failed to login: \(error.localizedDescription)")
            return
        }
        
        guard let accessToken = FBSDKAccessToken.current() else {
            print("Failed to get access token")
            return
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
        
        // Perform login by calling Firebase APIs
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
            
                return
            }
            
            // Present the main view
            let mainStoryBoard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
           
            let protectedPage = mainStoryBoard.instantiateViewController(withIdentifier: "TapBar")

            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = protectedPage
        })
        
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
     
    }
    override func viewWillDisappear(_ animated: Bool) {
        //Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
 
    
    
  



}

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 0 / 255.0, green: 85.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

