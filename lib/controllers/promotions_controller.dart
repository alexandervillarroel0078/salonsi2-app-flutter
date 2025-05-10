// controllers/promotions_controller.dart
import '../models/promotion.dart';
import '../services/promotions_api.dart';

class PromotionsController {
  static Future<List<Promotion>> obtenerPromociones() {
    return PromotionsApi.fetchPromotions();
  }
}
