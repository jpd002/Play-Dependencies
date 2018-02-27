cmake_minimum_required(VERSION 2.8.8)

project(SDWebImage)

set(SDWebImage_src
	../../SDWebImage/SDWebImage/NSData+ImageContentType.m
	../../SDWebImage/SDWebImage/NSImage+WebCache.m
	../../SDWebImage/SDWebImage/SDImageCache.m
	../../SDWebImage/SDWebImage/SDImageCacheConfig.m
	../../SDWebImage/SDWebImage/SDWebImageCompat.m
	../../SDWebImage/SDWebImage/SDWebImageDecoder.m
	../../SDWebImage/SDWebImage/SDWebImageDownloader.m
	../../SDWebImage/SDWebImage/SDWebImageDownloaderOperation.m
	../../SDWebImage/SDWebImage/SDWebImageManager.m
	../../SDWebImage/SDWebImage/SDWebImagePrefetcher.m
	../../SDWebImage/SDWebImage/UIButton+WebCache.m
	../../SDWebImage/SDWebImage/UIImage+GIF.m
	../../SDWebImage/SDWebImage/UIImage+MultiFormat.m
	../../SDWebImage/SDWebImage/UIImage+WebP.m
	../../SDWebImage/SDWebImage/UIImageView+HighlightedWebCache.m
	../../SDWebImage/SDWebImage/UIImageView+WebCache.m
	../../SDWebImage/SDWebImage/UIView+WebCache.m
	../../SDWebImage/SDWebImage/UIView+WebCacheOperation.m
)

add_library(SDWebImage_Static ${SDWebImage_src})
set_target_properties(SDWebImage_Static PROPERTIES COMPILE_FLAGS "-x objective-c -fobjc-arc")
target_include_directories(SDWebImage_Static PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../SDWebImage/)

