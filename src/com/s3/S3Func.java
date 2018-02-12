package com.s3;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.obj.ConstantVar;

public class S3Func {

	private static String SUFFIX = "/";

	private static AmazonS3 connectS3() {
		try {
			AWSCredentials credentials = new BasicAWSCredentials("AKIAJWP2ODJQ6MERPP4A", "d0JN1UZkHxYZi3NwCtAfxVP0hGtmaEUKV12963mJ");
			AmazonS3ClientBuilder ab = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials));
			ab.setRegion("ap-southeast-1");
			AmazonS3 s3 = ab.build();

			return s3;
		} catch (AmazonServiceException ase) {
			System.out.println("Caught an AmazonServiceException, which means your request made it "
					+ "to Amazon S3, but was rejected with an error response for some reason.");
			System.out.println("Error Message:    " + ase.getMessage());
			System.out.println("HTTP Status Code: " + ase.getStatusCode());
			System.out.println("AWS Error Code:   " + ase.getErrorCode());
			System.out.println("Error Type:       " + ase.getErrorType());
			System.out.println("Request ID:       " + ase.getRequestId());
			return null;
		} catch (AmazonClientException ace) {
			System.out.println("Caught an AmazonClientException, which means the client encountered "
					+ "a serious internal problem while trying to communicate with S3, " + "such as not being able to access the network.");
			System.out.println("Error Message: " + ace.getMessage());
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/*
	 * Create bucket for Organization after organization creation successfully
	 */
	public static Map<String, Object> createFolderForOrg(String bucketName, String folderName) {

		Map<String, Object> statusObj = new HashMap<>();
		try {
			AmazonS3 s3 = connectS3();

			if (s3 != null) {
				ObjectMetadata metadata = new ObjectMetadata();
				metadata.setContentLength(0);

				// create empty content
				InputStream emptyContent = new ByteArrayInputStream(new byte[0]);

				// create a PutObjectRequest passing the folder name suffixed by
				// /
				PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, folderName + SUFFIX, emptyContent, metadata);
				PutObjectRequest porAlbum = new PutObjectRequest(bucketName, folderName + SUFFIX + "album" + SUFFIX, emptyContent, metadata);
				PutObjectRequest porNewsletter = new PutObjectRequest(bucketName, folderName + SUFFIX + "newsletter" + SUFFIX, emptyContent,
						metadata);
				PutObjectRequest porMealLogo = new PutObjectRequest(bucketName, folderName + SUFFIX + "meal" + SUFFIX, emptyContent, metadata);
				PutObjectRequest porProfilePhoto = new PutObjectRequest(bucketName, folderName + SUFFIX + "profile" + SUFFIX, emptyContent, metadata);
				PutObjectRequest porLogo = new PutObjectRequest(bucketName, folderName + SUFFIX + "logo" + SUFFIX, emptyContent, metadata);

				s3.putObject(putObjectRequest);
				s3.putObject(porAlbum);
				s3.putObject(porNewsletter);
				s3.putObject(porMealLogo);
				s3.putObject(porProfilePhoto);
				s3.putObject(porLogo);

				statusObj.put("status", "Success");
				statusObj.put("remark", "");
			} else if (s3 == null) {
				statusObj.put("status", "Fail");
				statusObj.put("remark", "S3 null");
			}

		} catch (Exception e) {
			e.printStackTrace();
			statusObj.put("status", "Fail");
			statusObj.put("remark", ConstantVar.EXCEPTION_MSG);
		}
		return statusObj;
	}

	/*
	 * Create bucket for Parent after Parent registered successfully
	 */
	public static Map<String, Object> createFolderForParent(String bucketName, String folderName) {

		Map<String, Object> statusObj = new HashMap<>();
		try {
			AmazonS3 s3 = connectS3();

			if (s3 != null) {
				ObjectMetadata metadata = new ObjectMetadata();
				metadata.setContentLength(0);

				// create empty content
				InputStream emptyContent = new ByteArrayInputStream(new byte[0]);

				// create a PutObjectRequest passing the folder name suffixed by
				// /
				PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, "parentPhoto" + SUFFIX + folderName + SUFFIX + "parent" + SUFFIX,
						emptyContent, metadata);
				PutObjectRequest porAlbum = new PutObjectRequest(bucketName, "parentPhoto" + SUFFIX + folderName + SUFFIX + "child" + SUFFIX,
						emptyContent, metadata);

				s3.putObject(putObjectRequest);
				s3.putObject(porAlbum);

				statusObj.put("status", "Success");
				statusObj.put("remark", "");
			} else if (s3 == null) {
				statusObj.put("status", "Fail");
				statusObj.put("remark", "S3 null");
			}

		} catch (Exception e) {
			e.printStackTrace();
			statusObj.put("status", "Fail");
			statusObj.put("remark", ConstantVar.EXCEPTION_MSG);
		}
		return statusObj;
	}

	/*
	 * Upload file to Organization bucket
	 */
	public static Map<String, Object> uploadFileToBucket(String bucketName, String objectKey, File file, String fileName) {
		Map<String, Object> statusObj = new HashMap<>();
		try {
			AmazonS3 s3 = connectS3();

			if (s3 != null) {
				s3.putObject(new PutObjectRequest(bucketName, objectKey + fileName, file).withCannedAcl(CannedAccessControlList.PublicRead));

				statusObj.put("status", "Success");
				statusObj.put("url", s3.getUrl(ConstantVar.CURRENT_BUCKET, objectKey + fileName).toString());
				statusObj.put("remark", "");
			} else if (s3 == null) {
				statusObj.put("status", "Fail");
				statusObj.put("remark", "S3 null");
			}

		} catch (Exception e) {
			e.printStackTrace();
			statusObj.put("status", "Fail");
			statusObj.put("remark", ConstantVar.EXCEPTION_MSG);
		}
		return statusObj;
	}
	
	public static Map<String, Object> getObject(String bucketName, String objectKey) {
		Map<String, Object> statusObj = new HashMap<>();
		try {
			AmazonS3 s3 = connectS3();

			if (s3 != null) {
				statusObj.put("status", "Success");
				statusObj.put("size", s3.getObjectMetadata(bucketName, objectKey).getContentLength());
				statusObj.put("remark", "");
			} else if (s3 == null) {
				statusObj.put("status", "Fail");
				statusObj.put("remark", "S3 null");
			}

		} catch (Exception e) {
			e.printStackTrace();
			statusObj.put("status", "Fail");
			statusObj.put("remark", ConstantVar.EXCEPTION_MSG);
		}
		return statusObj;
	}
	
	/*
	 * Delete file or folder
	 */
	public static Map<String, Object> deleteFile(String bucketName, String objectKey) {
		Map<String, Object> statusObj = new HashMap<>();
		try {
			AmazonS3 s3 = connectS3();

			if (s3 != null) {
				//s3.putObject(new PutObjectRequest(bucketName, objectKey + fileName, file).withCannedAcl(CannedAccessControlList.PublicRead));
				s3.deleteObject(bucketName, objectKey);
				statusObj.put("status", "Success");
				statusObj.put("remark", "");
			} else if (s3 == null) {
				statusObj.put("status", "Fail");
				statusObj.put("remark", "S3 null");
			}

		} catch (Exception e) {
			e.printStackTrace();
			statusObj.put("status", "Fail");
			statusObj.put("remark", ConstantVar.EXCEPTION_MSG);
		}
		return statusObj;
	}
}
