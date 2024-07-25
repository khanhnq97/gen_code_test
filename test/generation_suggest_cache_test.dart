// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test_app/generation_suggest_cache/api_service/api_service.dart';
// import 'package:test_app/generation_suggest_cache/local_storage_service/local_storage_service.dart';
// import 'package:test_app/generation_suggest_cache/model.dart';
// import 'package:test_app/generation_suggest_cache/suggest_cache_service/suggest_cache_service.dart';
//
// // Mock các service
// class MockLocalStorageService extends Mock implements LocalStorageService {}
//
// class MockApiService extends Mock implements ApiService {}
//
// class MockSuggestCacheService extends Mock implements SuggestCacheService {}
//
// void main() {
//   group('Suggest Cache Generation Integration Test', () {
//     late MockLocalStorageService mockLocalStorage;
//     late MockApiService mockApiService;
//     late MockSuggestCacheService mockSuggestCacheService;
//
//     setUp(() {
//       mockLocalStorage = MockLocalStorageService();
//       mockApiService = MockApiService();
//       mockSuggestCacheService = MockSuggestCacheService();
//     });
//
//     testWidgets('Full suggest cache generation process',
//         (WidgetTester tester) async {
//       // Chuẩn bị dữ liệu giả
//       const stockMasterHash = 'stock_master_hash';
//       const suggestHash = 'suggest_hash';
//       final stockMasterResponse = StockMasterResponse(updateFlag: true, data: [
//         /* mock data */
//       ]);
//       final suggestDictionaryResponse =
//           SuggestDictionaryResponse(updateFlag: true, data: [
//         /* mock data */
//       ]);
//
//       // Thiết lập mock behaviors
//       when(mockLocalStorage.getStockMasterHash())
//           .thenAnswer((_) async => stockMasterHash);
//       when(mockLocalStorage.getSuggestHash())
//           .thenAnswer((_) async => suggestHash);
//       when(mockApiService.getStockMaster(stockMasterHash))
//           .thenAnswer((_) async => stockMasterResponse);
//       when(mockApiService.getSuggestDictionary(suggestHash))
//           .thenAnswer((_) async => suggestDictionaryResponse);
//       when(mockLocalStorage.saveStockMasterResponse(any))
//           .thenAnswer((_) async => true);
//       when(mockLocalStorage.saveSuggestDictionaryResponse(any))
//           .thenAnswer((_) async => true);
//       when(mockLocalStorage.saveStockMasterHash(any))
//           .thenAnswer((_) async => true);
//       when(mockLocalStorage.saveSuggestHash(any)).thenAnswer((_) async => true);
//       when(mockSuggestCacheService.generateSuggestCache())
//           .thenAnswer((_) async => true);
//
//       // Thực hiện quá trình tạo suggest cache
//       await performSuggestCacheGeneration(
//         localStorageService: mockLocalStorage,
//         apiService: mockApiService,
//         suggestCacheService: mockSuggestCacheService,
//       );
//
//       // Xác minh các bước đã được thực hiện
//       verify(mockLocalStorage.getStockMasterHash()).called(1);
//       verify(mockApiService.getStockMaster(stockMasterHash)).called(1);
//       verify(mockLocalStorage.saveStockMasterResponse(any)).called(1);
//       verify(mockLocalStorage.saveStockMasterHash(any)).called(1);
//
//       verify(mockLocalStorage.getSuggestHash()).called(1);
//       verify(mockApiService.getSuggestDictionary(suggestHash)).called(1);
//       verify(mockLocalStorage.saveSuggestDictionaryResponse(any)).called(1);
//       verify(mockLocalStorage.saveSuggestHash(any)).called(1);
//
//       verify(mockSuggestCacheService.generateSuggestCache()).called(1);
//     });
//
//     testWidgets('Suggest cache generation with API error',
//         (WidgetTester tester) async {
//       // Thiết lập mock behaviors để mô phỏng lỗi API
//       when(mockLocalStorage.getStockMasterHash()).thenAnswer((_) async => null);
//       when(mockApiService.getStockMaster(null))
//           .thenThrow(Exception('API Error'));
//
//       // Thực hiện quá trình tạo suggest cache
//       await performSuggestCacheGeneration(
//         localStorageService: mockLocalStorage,
//         apiService: mockApiService,
//         suggestCacheService: mockSuggestCacheService,
//       );
//
//       // Xác minh rằng quá trình dừng sau khi gặp lỗi API
//       verify(mockLocalStorage.getStockMasterHash()).called(1);
//       verify(mockApiService.getStockMaster(null)).called(1);
//       verifyNever(mockSuggestCacheService.generateSuggestCache());
//     });
//   });
// }
//
// Future<void> performSuggestCacheGeneration({
//   required LocalStorageService localStorageService,
//   required ApiService apiService,
//   required SuggestCacheService suggestCacheService,
// }) async {
//   // Implement the actual suggest cache generation process here
//   // This should follow the flow described in the original requirements
// }
