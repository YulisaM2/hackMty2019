import {Component, Input, OnInit} from '@angular/core';

@Component({
  selector: 'hack-chart',
  templateUrl: './chart.component.html',
  styleUrls: ['./chart.component.css']
})
export class ChartComponent implements OnInit {

  @Input() chartLabels = ['Sales Q1', 'Sales Q2', 'Sales Q3', 'Sales Q4'];
  @Input() chartData = [120, 150, 180, 90];
  @Input() chartType = 'doughnut';

  constructor() { }

  ngOnInit() {
  }

}
