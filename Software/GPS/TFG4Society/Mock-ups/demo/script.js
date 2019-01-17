function showSection(name, fullScreen=false) {
  for (let section of document.getElementsByClassName('section-active')) {    
    section.classList.remove('section-active');
    section.classList.add('section-hidden');  
  }
  document.getElementById("section-"+name).classList.remove('section-hidden');  
  document.getElementById("section-"+name).classList.add('section-active');  


  if (fullScreen) {
    // document.getElementsByTagName('footer')[0].style.display = 'none'
  }else{
    for (let footer of document.getElementsByClassName('footer-active')) {    
      footer.classList.remove('footer-active');
    }
    document.getElementById("footer-"+name).classList.add('footer-active');  
  }
}