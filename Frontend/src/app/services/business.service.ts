import { HttpClient, HttpErrorResponse, HttpEvent, HttpHeaders, HttpParams, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { catchError, Observable, throwError } from 'rxjs';@Injectable({
  providedIn: 'root'
})
export class BusinessService {
  private apiUrl = 'https://localhost:7045';
  constructor(private http: HttpClient) { }

   fetchBusinessData(pageSize:any,pageIndex:any,searchTerm:any): Observable<any> {
     if(searchTerm==''){
      return this.http.get<any>(`${this.apiUrl}/GetBusinessList?pageSize=${pageSize}&pageIndex=${pageIndex}`).pipe(
        catchError(this.handleError)
      );
     }
      return this.http.get<any>(`${this.apiUrl}/GetBusinessList?pageSize=${pageSize}&pageIndex=${pageIndex}&searchKeyword=${searchTerm}`).pipe(
        catchError(this.handleError)
      );
    }

    deleteBusiness(businessId: any): Observable<any> {
      return this.http.post<any>(`${this.apiUrl}/DeleteBusiness`,{"businessID":businessId}).pipe(
        catchError(this.handleError)
      );
    }

    fetchCategories(): Observable<any> {

      return this.http.get<any>(`${this.apiUrl}/GetCategories`).pipe(
        catchError(this.handleError)
      );
    }
    AddBusiness(payload:any): Observable<any> {

      return this.http.post<any>(`${this.apiUrl}/AddBusiness`,payload).pipe(
        catchError(this.handleError)
      );
    }
    UpdateBusiness(payload:any): Observable<any> {

      return this.http.post<any>(`${this.apiUrl}/UpdateBusinessDetails`,payload).pipe(
        catchError(this.handleError)
      );
    }
      private handleError(error: HttpErrorResponse) {
        let errorMessage = 'An error occurred';
    
        if (error.error instanceof ErrorEvent) {
         
          errorMessage = `Error: ${error.error.message}`;
        } else {
       
          if (error.status === 422) {
    
            errorMessage = error.error?.detail?.[0]?.msg || 'Invalid request format';
          } else {
            errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
          }
        }
    
        console.error(errorMessage);
        return throwError(() => new Error(errorMessage));
      }
}
