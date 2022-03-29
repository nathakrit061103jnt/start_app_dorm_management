class API {
  // static const BASE_URL = 'http://ec2-18-216-97-132.us-east-2.compute.amazonaws.com/';
  static const BASE_URL = 'http://192.168.1.9';
  static const PROJECT_NAME = '/start_app_dorm_management/www';
  // static const PROJECT_NAME = '/';
  static const IMAGES_URL_PAYMENT = '$BASE_URL/$PROJECT_NAME/admin/img/payment';
  static const UPDATE_RENTER =
      '$BASE_URL/$PROJECT_NAME/api/update_renter_new.php';
  static const LOGIN_RENTER = '$BASE_URL/$PROJECT_NAME/api/login_json.php';
  static const NEW_POST_API = '$BASE_URL/$PROJECT_NAME/api/get_new_posts.php';
  static const INVOICES_LES =
      '$BASE_URL/$PROJECT_NAME/api/get_invoices_les_id.php';
  static const RENTER = '$BASE_URL/$PROJECT_NAME/api/get_renter.php';

  static const PAYMENT_API = '$BASE_URL/$PROJECT_NAME/api/payment_json.php';

}
