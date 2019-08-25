import {Component, Input, OnInit} from '@angular/core';

@Component({
  selector: 'hack-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.css']
})
export class CardComponent implements OnInit {

  @Input() title = 'Default title';
  @Input() subtitle = 'Default subtitle';
  @Input() icon = 'fa fa-money-check-alt';
  @Input() color = 'purple';
  @Input() position = 'horizontal';
  @Input() body = 'Lorem ipsum';

  backgroundColor = {
    'purple': 'bg-purple',
    'green': 'bg-green',
    'white': 'bg-white'
  };

  textColor = {
    'purple': 'text-white',
    'green': 'text-white',
    'white': 'text-black'
  };

  constructor() { }

  ngOnInit() {
  }

}
