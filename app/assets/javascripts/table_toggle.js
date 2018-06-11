function tableToggle() {
    // Get all elements with class edit
    var tableToggle = document.getElementsByClassName('edit');
    var athleteAdd = document.getElementById('add-athlete');

    // get the edit button
    var editButton = document.getElementById('tableToggle');

    // get the current value of the edit button
    var buttonText = editButton.innerHTML;
    // now toggle the button and edit elements, depending on current state
    if (buttonText == 'Edit Tour') {
      // edit elements are hidden, show them

      Array.from(tableToggle).forEach((item) => {
        item.style.display = 'table-cell';
      });

      // change button text
      editButton.innerHTML = 'Finish Editing';
    }
    else {
      // edit elements are visible, hide them
      Array.from(tableToggle).forEach((item) => {
        item.style.display = 'none';
      });
      // change button text
      editButton.innerHTML = 'Edit Tour';
    }
  }
