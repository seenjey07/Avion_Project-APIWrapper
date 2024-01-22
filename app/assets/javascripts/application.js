document.addEventListener('DOMContentLoaded', function() {
  const newFactButton = document.getElementById('new-fact-button');

  if (newFactButton) {
    newFactButton.addEventListener('click', function() {
      location.reload();
    });
  }
});