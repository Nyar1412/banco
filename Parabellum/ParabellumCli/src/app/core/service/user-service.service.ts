import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http' ;
import { HttpHeaders } from '@angular/common/http';
import { throwError, Observable } from 'rxjs';
import { Usuario } from '../../shared/modelo/usuario.model' ;

@Injectable({
  providedIn: 'root'
})
export class UserServiceService {

  constructor(private _http: HttpClient) { }


    httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json',
        'Authorization' : 'None'
    })
  };
  private _userApiUrl = 'http://localhost:8000/api/';

  updatingHeaders(token: string): void {
    this.httpOptions.headers =
      this.httpOptions.headers.set('Authorization', token);
  }

  registerUser(usuario: Usuario): Observable<any> {
    const url = this._userApiUrl + 'register';
    return this._http.post<Usuario>(url, usuario);
  }

  loginUser(usuario: Usuario): Observable<any> {
    const url = this._userApiUrl + 'login';
    return this._http.post<Usuario>(url, usuario);
  }

  isLogged(): boolean {
    return (sessionStorage.getItem('token') !== null);
  }

  private handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      // A client-side or network error occurred. Handle it accordingly.
      console.error('An error occurred:', error.error.message);
    } else {
      // The backend returned an unsuccessful response code.
      // The response body may contain clues as to what went wrong,
      console.error(
        `Backend returned code ${error.status}, ` +
        `body was: ${error.error}`);
    }
    // return an observable with a user-facing error message
    return throwError(
      'Something bad happened; please try again later.');
  }




}
