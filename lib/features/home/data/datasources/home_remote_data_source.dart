import 'package:grocery_app/core/error/exceptions.dart';
import 'package:grocery_app/features/home/data/models/category_model.dart';
import 'package:grocery_app/features/home/data/models/promotion_model.dart';
import 'package:grocery_app/features/home/data/models/store_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<PromotionModel>> getPromotions();
  Future<List<StoreModel>> getTrendingStores();
  Future<List<StoreModel>> getNearbyStores();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  // In a real app, these would be fetched from an API
  // For this example, we'll return mock data
  
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      // Simulating API call
      await Future.delayed(const Duration(milliseconds: 300));
      
      final List<CategoryModel> categories = [
        const CategoryModel(
          id: '1',
          name: 'Food Delivery',
          icon: 'assets/icons/food_delivery.png',
          color: '#FF9800',
        ),
        const CategoryModel(
          id: '2',
          name: 'Medicines',
          icon: 'assets/icons/medicines.png',
          color: '#4CAF50',
        ),
        const CategoryModel(
          id: '3',
          name: 'Pet Supplies',
          icon: 'assets/icons/pet_supplies.png',
          color: '#9C27B0',
        ),
        const CategoryModel(
          id: '4',
          name: 'Gifts',
          icon: 'assets/icons/gifts.png',
          color: '#F44336',
        ),
        const CategoryModel(
          id: '5',
          name: 'Meat',
          icon: 'assets/icons/meat.png',
          color: '#795548',
        ),
        const CategoryModel(
          id: '6',
          name: 'Cosmetic',
          icon: 'assets/icons/cosmetic.png',
          color: '#00BCD4',
        ),
        const CategoryModel(
          id: '7',
          name: 'Stationery',
          icon: 'assets/icons/stationery.png',
          color: '#3F51B5',
        ),
        const CategoryModel(
          id: '8',
          name: 'Stores',
          icon: 'assets/icons/stores.png',
          color: '#FF5722',
        ),
      ];
      
      return categories;
    } catch (e) {
      throw ServerException(message: 'Failed to load categories');
    }
  }

  @override
  Future<List<PromotionModel>> getPromotions() async {
    try {
      // Simulating API call
      await Future.delayed(const Duration(milliseconds: 300));
      
      final List<PromotionModel> promotions = [
        const PromotionModel(
          id: '1',
          title: '',
          description: 'DISCOUNT\n25% ALL\nFRUITS',
          imageUrl: 'assets/images/fruits_promo.png',
          buttonText: 'CHECK NOW',
          discountText: '25% OFF',
        ),
        const PromotionModel(
          id: '2',
          title: '',
          description: 'SPECIAL OFFER\n30% OFF\nVEGETABLES',
          imageUrl: 'assets/images/vegetables_promo.png',
          buttonText: 'SHOP NOW',
          discountText: '30% OFF',
        ),
      ];
      
      return promotions;
    } catch (e) {
      throw ServerException(message: 'Failed to load promotions');
    }
  }

  @override
  Future<List<StoreModel>> getTrendingStores() async {
    try {
      // Simulating API call
      await Future.delayed(const Duration(milliseconds: 300));
      
      final List<StoreModel> stores = [
        const StoreModel(
          id: '1',
          name: 'Mithas Bhandar',
          imageUrl: 'assets/images/mithas_bhandar.png',
          address: 'Sector 18, Noida',
          rating: 4.1,
          distance: 1.4,
          timeMinutes: 40,
        ),
        const StoreModel(
          id: '2',
          name: 'Mithas Bhandar',
          imageUrl: 'assets/images/mithas_bhandar.png',
          address: 'Sector 18, Noida',
          rating: 4.1,
          distance: 1.4,
          timeMinutes: 40,
        ),
      ];
      
      return stores;
    } catch (e) {
      throw ServerException(message: 'Failed to load trending stores');
    }
  }

  @override
  Future<List<StoreModel>> getNearbyStores() async {
    try {
      // Simulating API call
      await Future.delayed(const Duration(milliseconds: 300));
      
      final List<StoreModel> stores = [
        const StoreModel(
          id: '3',
          name: 'Freshly Baker',
          imageUrl: 'assets/images/freshly_baker.png',
          address: 'Sector 63, Noida',
          rating: 4.1,
          distance: 1.4,
          timeMinutes: 45,
          discount: 'Upto 10% OFF',
          itemsAvailable: '3400+ items available',
        ),
        const StoreModel(
          id: '4',
          name: 'Freshly Baker',
          imageUrl: 'assets/images/freshly_baker.png',
          address: 'Sector 63, Noida',
          rating: 4.1,
          distance: 1.4,
          timeMinutes: 45,
          discount: 'Upto 10% OFF',
          itemsAvailable: '3400+ items available',
        ),
      ];
      
      return stores;
    } catch (e) {
      throw ServerException(message: 'Failed to load nearby stores');
    }
  }
}
