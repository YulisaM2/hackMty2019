import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DbService {

  constructor() { }

  baseUrl = 'https://us-central1-aesthetic-joy-250904.cloudfunctions.net/';

  get(func) {
    return fetch(this.baseUrl + func,
      {
        method: 'GET',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      })
      .then(data => {
        return data.json();
      });
  }
}
