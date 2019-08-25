import {Component, Input, OnInit} from '@angular/core';

@Component({
  selector: 'hack-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.css']
})
export class CardComponent implements OnInit {

  @Input() title = 'Default title';
  @Input() subtitle = null;
  @Input() icon = 'fa fa-money-check-alt';
  @Input() color = 'white';
  @Input() textColor = 'black';
  @Input() position = 'horizontal';
  @Input() body = null;

  colors = [
    '#00c2a2',
    '#8972DA',
  ];


  constructor() { }

  ngOnInit() {
  }

}
