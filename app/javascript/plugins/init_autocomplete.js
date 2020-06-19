import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('ship_location');
  if (locationInput) {
    places({ container: locationInput });
  }

  const destinationInput = document.getElementById('ship_destination');
  if (destinationInput) {
    places({ container: destinationInput });
  }
};

export { initAutocomplete };
