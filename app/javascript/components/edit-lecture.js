
// const editLecture = () => {
//   const editButton = document.querySelectorAll(".edit-lecture");
//   const formBlock = document.getElementById("form-for-edit-lecture");
//   editButton.forEach((edit) => {
//     edit.addEventListener("click", (event) => {
//       event.preventDefault();
//       const form = "<%= escape_javascript render(:partial => 'lectures/shared/edit-modal', :locals => { lecture: @lecture } %>" ;
//       formBlock.insertAdjacentHTML("beforeend", form);
//     })
//   });
// };

// export { editLecture };

$("#edit-lecture-link").on("click", function () {

  //call ajax to show preview of the post in the preview container
  var lecture_id = $(this).data("lecture_id");
  //this is the show call to lectures_controller#edit
  $.ajax({
    url: "/lectures/'" + lecture_id,
    beforeSend: function (xhr) {
      //change text of a tag to loading
    }
  })
    .done(function (data) {

    });

})





