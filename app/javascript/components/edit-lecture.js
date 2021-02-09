
// const editLecture = () => {
//   const editButtons = document.querySelectorAll(".edit-lecture");
//   // const formBlock = document.getElementById("edit-lecture-ajax");

//   editButtons.forEach((button) => {
//     button.addEventListener("click", (event) => {
//       event.preventDefault();

//       $('#edit-lecture-ajax').append("<%= escape_javascript render(:partial => 'lectures/shared/edit-modal', :locals => { :lecture: @lecture }) %>");
//       // const form = `<%= escape_javascript render(:partial => 'lectures/shared/edit-modal', :locals => { lecture: @lecture } %>`;
//       // formBlock.insertAdjacentHTML("beforeend", form);
//     })
//   });
// };

// export { editLecture };

// $("#edit-lecture-link").on("click", function () {

//   //call ajax to show preview of the post in the preview container
//   var lecture_id = $(this).data("lecture_id");
//   //this is the show call to lectures_controller#edit
//   $.ajax({
//     url: "/lectures/'" + lecture_id,
//     beforeSend: function (xhr) {
//       //change text of a tag to loading
//     }
//   })
//     .done(function (data) {

//     });

// })





