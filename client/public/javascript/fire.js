import { initializeApp } from 'firebase/app';
// Follow this pattern to import other Firebase services
// import { } from 'firebase/<service>';

// TODO: Replace the following with your app's Firebase project configuration
const firebaseConfig = {
    apiKey: "AIzaSyDJBF8sUiD6n_yl5O8IIX3jSAMZ2UdCjcI",
    authDomain: "gp-police.firebaseapp.com",
    databaseURL: "https://gp-police-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "gp-police",
    storageBucket: "gp-police.appspot.com",
    messagingSenderId: "399031635594",
    appId: "1:399031635594:web:b670b1a298056e12f76773",
    measurementId: "G-FGPZD71DER"
  };
const fire =firebaseConfig.initializeApp(firebaseConfig);