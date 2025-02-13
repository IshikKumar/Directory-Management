import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { catchError, throwError } from 'rxjs';

export const authInterceptor: HttpInterceptorFn = (req, next) => {

  const router = inject(Router);
  const snackBar = inject(MatSnackBar); // Inject MatSnackBar
 

 
  const authReq = req.clone({
        setHeaders: {  'content-type': 'application/json'},
      })


  // Pass the request and handle errors
  return next(authReq).pipe(
    catchError((error) => {
      if (error) {
       
        
        // Show snackbar for session expiration
        snackBar.open(error.message, 'Close', {
          duration: 5000, // 5 seconds
          verticalPosition: 'top',
          horizontalPosition: 'center',
          panelClass: ['snackbar-error'], // Add a custom class for styling
        });
      }
      return throwError(() => error);
    })
  );

};
