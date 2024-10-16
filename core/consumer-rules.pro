##---------------Begin: proguard configuration for SQLCipher  ----------
-keep,includedescriptorclasses class net.sqlcipher.** { *; }
-keep,includedescriptorclasses interface net.sqlcipher.** { *; }


##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature

# For using GSON @Expose annotation
-keepattributes *Annotation*

# Gson specific classes
-dontwarn sun.misc.**
#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { <fields>; }

# Prevent proguard from stripping interface information from TypeAdapter, TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}


##---------------Begin: proguard configuration for Retrofit  ----------
# Retrofit does reflection on generic parameters. InnerClasses is required to use Signature and
# EnclosingMethod is required to use InnerClasses.
-keepattributes Signature, InnerClasses, EnclosingMethod

# Retrofit does reflection on method and parameter annotations.
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations

# Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}

-repackageclasses @interface androidx.annotation.Keep
-repackageclasses class <1>
-allowaccessmodification class <1>
-keep,allowobfuscation @interface androidx.annotation.Keep
-keep public class androidx.versionedparcelable.ParcelImpl
-keep class * implements androidx.versionedparcelable.VersionedParcelable
-keep,allowobfuscation,allowshrinking,allowoptimization class <1>
-keep,allowobfuscation,allowshrinking class retrofit2.Response
-keep,allowobfuscation interface <1>
-keep,allowobfuscation interface * extends <1>
-keep,allowobfuscation,allowshrinking,allowoptimization class <3>
-keep,allowobfuscation,allowshrinking class kotlin.coroutines.Continuation
-keep class * extends androidx.room.RoomDatabase
-keep,allowobfuscation,allowshrinking class * extends androidx.navigation.Navigator
-keep class com.example.flickscout.core.data.Resource { *; }
-keep class com.example.flickscout.core.domain.model.Movie { *; }
-keep class com.example.flickscout.core.domain.repository.IMovieRepository { *; }
-keep class com.example.flickscout.core.domain.usecase.MovieUseCase { *; }
-keep class com.example.flickscout.core.ui.MoviesAdapter { *; }
-keep class com.example.flickscout.core.di.CoreModuleKt { *; }

-keep class com.example.flickscout.core.data.source.remote.response.MoviesResponse { *; }
-keep class com.example.flickscout.core.data.source.remote.response.ResultsItem { *; }

# Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**

# Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit

# Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*

# With R8 full mode, it sees no subtypes of Retrofit interfaces since they are created with a Proxy
# and replaces all potential values with null. Explicitly keeping the interfaces prevents this.
-if interface * { @retrofit2.http.* <methods>; }
-keep,allowobfuscation interface <1>

-dontwarn kotlinx.**


##---------------Begin: proguard configuration for Glide  ----------
# Keep Coil-related classes
-keep class coil.** { *; }
-keep interface coil.** { *; }

# Keep Glide-related classes used by Coil (if you use the Coil-Glide integration)
-keep class com.bumptech.glide.** { *; }
-keep interface com.bumptech.glide.** { *; }

-keep class com.example.flickscout.** { *; }
# Keep metadata for Coil's reflection usage
-keepattributes Signature, InnerClasses, EnclosingMethod

# JSR 305 annotations are for embedding nullability information.
-dontwarn javax.annotation.**

# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

# OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform
-dontwarn org.conscrypt.ConscryptHostnameVerifier

-dontwarn com.airbnb.lottie.**
-keep class com.airbnb.lottie.** {*;}