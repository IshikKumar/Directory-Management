import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from './features/header/header.component';
import { DashboardComponent } from './features/dashboard/dashboard.component';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [HeaderComponent,DashboardComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'FrontendDesign';
}
