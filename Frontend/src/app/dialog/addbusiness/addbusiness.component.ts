import { CommonModule, NgFor } from '@angular/common';
import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatOptionModule } from '@angular/material/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatError, MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { BusinessService } from '../../services/business.service';

@Component({
  selector: 'app-addbusiness',
  standalone: true,
  imports: [
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatIconModule, MatSelectModule,
    MatOptionModule, NgFor, CommonModule, ReactiveFormsModule, MatError
  ],
  templateUrl: './addbusiness.component.html',
  styleUrl: './addbusiness.component.css'
})
export class AddbusinessComponent {
  businessForm!: FormGroup;
  categories!: any[] 

  constructor(private fb: FormBuilder,private businessservice:BusinessService,private dialogRef:MatDialogRef<AddbusinessComponent>, @Inject(MAT_DIALOG_DATA) public data: any) {
   
  }
 
  ngOnInit() {
    this.businessForm = this.fb.group({
      name: ['', Validators.required],
      categoryID: ['',[Validators.required]],
      address: [''],
      city: ['', [Validators.required,Validators.pattern('[a-zA-Z ]*')]],
      state: ['', [Validators.required,Validators.pattern('[a-zA-Z ]*')]],
      zipCode: ['', [Validators.required,Validators.pattern('^[0-9]{6}$')]],
      phoneNumber: ['', [Validators.pattern(/^\d{10}$/), Validators.required]],
      website: ['', [Validators.pattern(/^[a-zA-Z0-9.-]+\.com$/)]],
      rating: ['', [Validators.min(1), Validators.max(5)]]
    });
    this.businessservice.fetchCategories().subscribe({
      next:(data)=>{
      this.categories=data.result
      }
    })
    if (this.data) {
      
      this.businessForm.patchValue({
        name: this.data.name,
        categoryID: this.data.categoryId,
        address: this.data.address,
        city: this.data.city,
        state: this.data.state,
        zipCode: this.data.zipCode,
        phoneNumber: this.data.phoneNumber,
        website: this.data.website,
        rating: this.data.rating
      });
    }
    
   
  }

  onSubmit(): void {
    if (this.businessForm.valid) {
      const {name,address,city,state,zipCode,phoneNumber,categoryID,website,rating}=this.businessForm.value
      const payload={
        "name": name,
        "address": address,
        "city":city,
        "state": state,
        "zipCode": zipCode,
        "phoneNumber":phoneNumber,
       "categoryID": Number(categoryID),
        "website": website,
        "rating": Number(rating)
      }
     this.businessservice.AddBusiness(payload).subscribe((data)=>{
     this.dialogRef.close(data.message)
      
     })
    } else {
      this.businessForm.markAllAsTouched();
    }
  }

  closeDialog(): void {
 this.dialogRef.close()
  }
  onUpdate(): void {
    if (this.businessForm.valid) {
      const {name,address,city,state,zipCode,phoneNumber,categoryID,website,rating}=this.businessForm.value
      const payload={
        "businessID": this.data.businessID,
        "name": name,
        "address": address,
        "city":city,
        "state": state,
        "zipCode": zipCode,
        "phoneNumber":phoneNumber,
        "categoryID": Number(categoryID),
        "website": website,
        "rating": Number(rating)
      }
     this.businessservice.UpdateBusiness(payload).subscribe((data)=>{
      this.dialogRef.close(data.message)
     })
    } else {
      this.businessForm.markAllAsTouched();
    }
  }
}
