  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.9.2/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.9.2/firebase-analytics.js";
  
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
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

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);