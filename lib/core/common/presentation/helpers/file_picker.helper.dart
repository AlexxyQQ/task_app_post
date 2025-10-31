import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

/// An abstract interface for a file and media selection service.
///
/// This interface defines methods for selecting files, images, and directories
/// from a device's storage or gallery. It is designed to be platform-agnostic
/// and easily mockable for testing.
abstract class IFileSelectorHelper {
  /// Picks a single file from the device’s file system.
  ///
  /// Optionally, you can filter files by providing a list of [allowedExtensions].
  /// For example:
  /// ```dart
  /// final file = await fileSelector.selectSingleFile(allowedExtensions: ['pdf', 'json']);
  /// ```
  ///
  /// Returns the selected [File], or `null` if the user cancels the selection.
  Future<File?> selectSingleFile({List<String>? allowedExtensions});

  /// Picks multiple files from the device’s file system.
  ///
  /// You can restrict selectable file types using [allowedExtensions].
  /// For example:
  /// ```dart
  /// final files = await fileSelector.selectMultipleFiles(allowedExtensions: ['jpg', 'png']);
  /// ```
  ///
  /// Returns a list of selected [File] objects, or `null` if cancelled.
  Future<List<File>?> selectMultipleFiles({List<String>? allowedExtensions});

  /// Opens the device gallery to pick a single image.
  ///
  /// Returns the selected image as a [File], or `null` if the user cancels.
  Future<File?> selectSingleImageFromGallery();

  /// Opens the device gallery to pick multiple images at once.
  ///
  /// Returns a list of selected image [File] objects.
  /// If the user cancels, an empty list or `null` is returned.
  Future<List<File>?> selectMultipleImagesFromGallery();

  /// Opens a system directory picker to select a directory path.
  ///
  /// Returns the selected directory path as a [String], or `null` if cancelled.
  Future<String?> selectDirectory();
}

/// Concrete implementation of [IFileSelectorHelper] using:
/// - [file_picker] for general file and directory selection
/// - [image_picker] for image selection from gallery
///
/// This class abstracts away platform-specific picker details and provides
/// consistent, testable APIs for file and media selection.
class FileSelectorHelperImpl implements IFileSelectorHelper {
  /// Creates a new instance of [FileSelectorHelperImpl].
  ///
  /// You can inject custom [filePicker] and [imagePicker] instances for testing
  /// or dependency management. By default, it uses:
  /// - [FilePicker.platform]
  /// - [ImagePicker()]
  FileSelectorHelperImpl({FilePicker? filePicker, ImagePicker? imagePicker})
    : _filePicker = filePicker ?? FilePicker.platform,
      _imagePicker = imagePicker ?? ImagePicker();

  final FilePicker _filePicker;
  final ImagePicker _imagePicker;

  /// {@macro IFileSelectorHelper.selectSingleFile}
  @override
  Future<File?> selectSingleFile({List<String>? allowedExtensions}) async {
    try {
      final result = await _filePicker.pickFiles(
        type: allowedExtensions != null ? FileType.custom : FileType.any,
        allowedExtensions: allowedExtensions,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      print('Error picking single file: $e');
      throw Exception('Error picking single file: $e');
    }
    return null;
  }

  /// {@macro IFileSelectorHelper.selectMultipleFiles}
  @override
  Future<List<File>?> selectMultipleFiles({
    List<String>? allowedExtensions,
  }) async {
    try {
      final result = await _filePicker.pickFiles(
        type: allowedExtensions != null ? FileType.custom : FileType.any,
        allowedExtensions: allowedExtensions,
        allowMultiple: true,
      );

      if (result != null) {
        return result.paths
            .whereType<String>()
            .map((path) => File(path))
            .toList();
      }
    } catch (e) {
      print('Error picking multiple files: $e');
      throw Exception('Error picking multiple files: $e');
    }
    return null;
  }

  /// {@macro IFileSelectorHelper.selectSingleImageFromGallery}
  @override
  Future<File?> selectSingleImageFromGallery() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking single image: $e');
      throw Exception('Error picking single image: $e');
    }
    return null;
  }

  /// {@macro IFileSelectorHelper.selectMultipleImagesFromGallery}
  @override
  Future<List<File>?> selectMultipleImagesFromGallery() async {
    try {
      final pickedFiles = await _imagePicker.pickMultiImage();
      return pickedFiles.map((xfile) => File(xfile.path)).toList();
    } catch (e) {
      print('Error picking multiple images: $e');
      throw Exception('Error picking multiple images: $e');
    }
  }

  /// {@macro IFileSelectorHelper.selectDirectory}
  @override
  Future<String?> selectDirectory() async {
    try {
      return await _filePicker.getDirectoryPath();
    } catch (e) {
      print('Error selecting directory: $e');
      throw Exception('Error selecting directory: $e');
    }
  }
}
