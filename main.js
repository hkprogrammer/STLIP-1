function save(Class, Category, Grade){


	var pointer = document.getElementById(Grade + Category);

	var obj = pointer.childNodes[1];
	obj.style.display = "none";
	obj.classList.remove("show")




	pointer.innerHTML = Class;
	

	var backdrop = document.getElementsByClassName('modal-backdrop')[0]

	backdrop.parentNode.removeChild(backdrop);

	//document.getElementById(Grade + Category).modal("toggle");
	
}
