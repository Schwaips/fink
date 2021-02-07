const editLecture = () => {
  const editButton = document.querySelectorAll(".edit-lecture");
  const formBlock = document.getElementById("form-for-edit-lecture");
  editButton.forEach((edit) => {
    edit.addEventListener("click", (event) => {
      event.preventDefault();
      const form = "<%= escape_javascript render(:partial => 'lectures/shared/edit-modal', :locals => { lecture: @lecture } %>" ;
      formBlock.insertAdjacentHTML("beforeend", form);
    })
  });
};

export { editLecture };









