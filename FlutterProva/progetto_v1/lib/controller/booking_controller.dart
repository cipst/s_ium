import 'package:get/get.dart';
import 'package:progetto_v1/controller/error_controller.dart';
import 'package:progetto_v1/db/booking_helper.dart';
import 'package:progetto_v1/model/booking.dart';

class BookingController extends GetxController {
  final List<Booking> bookings = <Booking>[].obs;

  Future<int> setBooking(Booking booking) async {
    return await BookingHelper.setBooking(booking);
  }

  Future<List<Booking>?> getAllBookings(String email) async {
    try {
      ErrorController.clear();
      List<Booking>? bookingsList = await BookingHelper.getAllBookings(email);

      if(bookingsList == null) return null;

      for (Booking b in bookingsList) {
        bookings.add(b);
      }

      return bookingsList;
    } on Exception catch (e) {
      ErrorController.text.value = e.toString();
      return null;
    } on Error catch (e) {
      ErrorController.text.value = e.toString();
      return null;
    }
  }

  Future<Booking?> getBooking(int id) async {
    try {
      ErrorController.clear();
      return await BookingHelper.getBooking(id);
    } on Exception catch (e) {
      ErrorController.text.value = e.toString();
      return null;
    } on Error catch (e) {
      ErrorController.text.value = e.toString();
      return null;
    }
  }

  Future<List<Booking>?> getBookingByDate(String email, String datetime) async{
    try {
      ErrorController.clear();
      List<Booking>? bookingsList = await BookingHelper.getBookingByDate(email, datetime);

      if(bookingsList == null) return null;

      for (Booking b in bookingsList) {
        bookings.add(b);
      }

      return bookingsList;
    } on Exception catch (e) {
      ErrorController.text.value = e.toString();
      return null;
    } on Error catch (e) {
      ErrorController.text.value = e.toString();
      return null;
    }
  }
}
