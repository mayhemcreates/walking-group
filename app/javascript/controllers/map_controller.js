import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object,
  };

  connect() {

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element, // html element with controller on
      style: "mapbox://styles/mapbox/navigation-day-v1",
    });

    this.#addMarkerToMap();
    this.#fitMapToMarker();
  }

  // '#' means private method

  #addMarkerToMap() {
    new mapboxgl.Marker().setLngLat([this.markerValue.lng, this.markerValue.lat]).addTo(this.map);
  }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([this.markerValue.lng, this.markerValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
