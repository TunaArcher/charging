/* -- LIST OF Constants used in APIs -- */

/// API EVX
/// Authentication
const String evxEndPoint = 'http://192.168.1.6:3000/api/v1'; // ต้องแก้ IP เครื่องที่เดฟอยู่ (ไว้อัพ Production ถึงจะเป็น URL จริง)
const String evxRegistration = evxEndPoint + '/auth/register';
const String evxLogin = evxEndPoint + '/auth/login';