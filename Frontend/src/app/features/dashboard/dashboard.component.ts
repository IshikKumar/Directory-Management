import { Component, inject, OnInit, ViewChild } from '@angular/core';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatIconModule } from '@angular/material/icon';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CommonModule, CurrencyPipe } from '@angular/common';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { FormsModule } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSort, MatSortModule, Sort } from '@angular/material/sort';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatTooltipModule } from '@angular/material/tooltip';
import { AddbusinessComponent } from '../../dialog/addbusiness/addbusiness.component';
import { BusinessService } from '../../services/business.service';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';

interface BusinessInfo {
  id: number;
  businessName: string;
  category: string;
  address: string;
  city: string;
  state: string;
  zipcode: string;
  phone: string;
  website?: string;
  rating: number;
}

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
 
    MatTableModule,
    MatSortModule,
    MatSlideToggleModule,
    FormsModule,
    CommonModule,
    MatGridListModule,
    MatPaginatorModule,
    MatCardModule,
    MatInputModule,
    MatFormFieldModule,
    MatToolbarModule,
    MatIconModule,


    MatProgressSpinnerModule,
    MatTooltipModule
  ],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css',
})
export class DashboardComponent implements OnInit {
  readonly dialog = inject(MatDialog);
  length = 26;
  pageSize = 10;
  pageIndex = 0;
  pageSizeOptions = [5, 10];
  hidePageSize = false;
  showPageSizeOptions = true;
  showFirstLastButtons = true;
  disabled = false;

  pageEvent!: PageEvent;
  snackBar = inject(MatSnackBar); 
  handlePageEvent(e: PageEvent) {
    this.pageSize = e.pageSize;
    this.pageIndex = e.pageIndex;
    this.loadBusinessData(this.pageSize,this.pageIndex,this.searchTerm)
  }


  
  businessInfo!: BusinessInfo[]
  dataSource!:any; 
  admindisplayedcolumns: string[] = [
    'name',
    'category',
    'address',
    'city',
    'state',
    'phone',
    'website',
    'rating',
    'actions'
  ];



  constructor(private businessservice:BusinessService) {}
  @ViewChild(MatSort) sort!: MatSort;

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }
  ngOnInit(): void {
   
    this.loadBusinessData(this.pageSize,this.pageIndex,'');
    
  }
  searchTerm: string = '';
  filteredBusinessInfo: BusinessInfo[] = [];

  editBusiness(data:any){
   const dialogRef= this.dialog.open(AddbusinessComponent, {
      height: '500px',
      data:data
    });
    dialogRef.afterClosed().subscribe({
      next:(data)=>{
        if(data=='Business details updated successfully.'){
          this.snackBar.open(data, 'Close', {
            duration: 5000, // 5 seconds
            verticalPosition: 'top',
            horizontalPosition: 'center',
            panelClass: ['snackbar-success'], // Add a custom class for styling
          });
        }
        this.loadBusinessData(this.pageSize,this.pageIndex,this.searchTerm)
      }
    })
  }
  
  loadBusinessData(pageSize:any,pageIndex:any,searchTerm:any): void {
   
    this.businessservice.fetchBusinessData(pageSize,pageIndex+1,searchTerm.trim()).subscribe({
      next:(data:any)=>{
        this.businessInfo=data.result
        this.length=data.totalCount
        this.dataSource=new MatTableDataSource(this.businessInfo);
        this.dataSource.sort = this.sort;
      }
    })
  }

 
  addBusiness() {
    const dialogRef= this.dialog.open(AddbusinessComponent, {
      // width: '500px',
      height: '500px',
    });
    dialogRef.afterClosed().subscribe({
      next:(data)=>{
        console.log(data);
        
        if(data=='Business added successfully.'){
          this.snackBar.open(data, 'Close', {
            duration: 5000, // 5 seconds
            verticalPosition: 'top',
            horizontalPosition: 'center',
            panelClass: ['snackbar-success'], // Add a custom class for styling
          });
        }
        this.loadBusinessData(this.pageSize,this.pageIndex,this.searchTerm)
      }
    })
  }
 
 
 

  deleteBusiness(business: any): void {
    Swal.fire({
      title: `Are you sure?`,
      text: `Do you want to delete organisation?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No',
    }).then((result) => {
      if (result.isConfirmed) {
      
        this.businessservice.deleteBusiness(business.businessID).subscribe(
          {
            next:(result)=>{
              console.log(result);
              this.snackBar.open(result.message, 'Close', {
                duration: 5000, // 5 seconds
                verticalPosition: 'top',
                horizontalPosition: 'center',
                panelClass: ['snackbar-error'], // Add a custom class for styling
              });
              this.loadBusinessData(this.pageSize,this.pageIndex,this.searchTerm);
            }
        
        });
        
      }
    });
    
  }
 
  
  filter(){
    this.loadBusinessData(this.pageSize,this.pageIndex,this.searchTerm);
  }

  
  
}