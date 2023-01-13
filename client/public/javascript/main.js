const form = document.querySelector('form');
const inputfile =  document.querySelector('input[type=file]')
const uploadfile = document.querySelector('.upload-file');
const uploaded = document.querySelector('.uploaded');
const error = document.querySelector('.error');


form.onclick = e =>{
  inputfile.click();
}


inputfile.onchange = e => {

 console.log(e.target.files);
  const file_Name = e.target.files[0].name;

  const splitName = file_Name.split('.');

  const final_name = splitName[0].length > 20 ? splitName[0].substr(0,25).concat("..."+splitName[1]): splitName[0];

  let xhr = new XMLHttpRequest();
  xhr.open('POST',"/profile", true);

  xhr.upload.onprogress = ({loaded, total}) =>{
    loadedKB = Math.floor(loaded/1000);
    totalKB = Math.floor(total/1000);

    percentage = Math.floor(loadedKB/totalKB * 100);

    size = totalKB < 1024 ? `${loadedKB} KB` : `${(loadedKB/1024).toFixed(2)} MB`;
    console.log(size);

   uploadfile.innerHTML = `

    <i class="fas fa-file-alt"></i>
         <div class="content">
           <div>
             <span>${final_name}</span>
             <span>Uploading ${percentage}%</span>

           </div>

           <div style="width: ${percentage}%" class="progress-bar"></div>

         </div>`;



  }
  xhr.onload = e => {
   const { err}  =  JSON.parse(xhr.response);
   

   if(err) {
     uploadfile.innerHTML = '';
     const { name , message, code}  = err;
     message2 = "";
     if(code == "LIMIT_FILE_SIZE"){
       message2 = "image size must be lesser than 2mb,";
     }
     
    // alert(name +": " +message) 
     error.style.display = "block";
     error.style.opacity = '100';
     error.innerText = message2+message;
     setTimeout((e) => {
       error.style.opacity = '0';
       error.style.display = 'none';
     }, 3000);
     return;
   }
 
   
     if (loadedKB == totalKB) {
    uploadfile.innerHTML = '';
      let uploadedContent = `
             <div class="upload-file">
               <i class="fas fa-file-alt"></i>
               <div class="content">
                 <div>
                   <span>${final_name}</span>
                   <i class="fa fa-check"></i>
                 </div>

                 <div class="size">${size}</div>

               </div>     
             </div>` ;

       uploaded.insertAdjacentHTML('afterbegin',uploadedContent);
       

  }


   
  }
  xhr.send(new FormData(form));
  console.log("request send");
}