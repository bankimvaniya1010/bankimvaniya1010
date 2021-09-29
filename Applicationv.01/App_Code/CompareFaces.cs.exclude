using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Amazon.Rekognition;
using Amazon.Rekognition.Model;
using Amazon.Runtime;
using Amazon.S3.Transfer;
using Amazon.S3;
using Amazon;
using Amazon.Runtime.CredentialManagement;
using Amazon.S3.IO;
/// <summary>
/// Summary description for CompareFaces
/// </summary>
public class CompareFaces
{
    public string Example(string captureimage, string s3storedimgid)
    {
        string result = string.Empty;
        float similarityThreshold = 70F;

        String sourceImage = captureimage;// "D:/HS_Project/edu_app/Applicationv.01/Docs/webcamCapture/ahs.png";
        String targetImage = null;//"D:/HS_Project/edu_app/Applicationv.01/Docs/webcamCapture/ahs.png";//"D:/HS_Project/edu_app/Applicationv.01/Docs/webcamCapture/as.png";
        
        AmazonRekognitionClient rekognitionClient = null;
        CredentialProfile basicProfile;
        AWSCredentials awsCredentials;
        var sharedFile = new SharedCredentialsFile();
        if (sharedFile.TryGetProfile("default", out basicProfile) &&
            AWSCredentialsFactory.TryGetAWSCredentials(basicProfile, sharedFile, out awsCredentials))
        {
            using (var client = new AmazonS3Client(awsCredentials, basicProfile.Region))
            {

                var response = client.ListBuckets();

                string bucketName = "mysecondbasket";
                S3DirectoryInfo dir = new S3DirectoryInfo(client, bucketName);
                foreach (IS3FileSystemInfo file in dir.GetFiles())
                {
                    if (file.Name == s3storedimgid)
                    {
                        targetImage = "https://applicantprofile.s3.ap-south-1.amazonaws.com/179_U1";// file.ToString();
                        break;
                    }
                }

            }
            rekognitionClient = rekognitionClient = new AmazonRekognitionClient(awsCredentials, basicProfile.Region);
        }


        Amazon.Rekognition.Model.Image imageSource = new Amazon.Rekognition.Model.Image();
        try
        {
            using (FileStream fs = new FileStream(sourceImage, FileMode.Open, FileAccess.Read))
            {
                byte[] data = new byte[fs.Length];
                fs.Read(data, 0, (int)fs.Length);
                imageSource.Bytes = new MemoryStream(data);
            }
        }
        catch (Exception)
        {
            Console.WriteLine("Failed to load source image: " + sourceImage);
            result = "Failed to load source image: " + sourceImage;
            return result;
        }

        Amazon.Rekognition.Model.Image imageTarget = new Amazon.Rekognition.Model.Image();
        try
        {
            using (FileStream fs = new FileStream(targetImage, FileMode.Open, FileAccess.Read))
            {
                byte[] data = new byte[fs.Length];
                data = new byte[fs.Length];
                fs.Read(data, 0, (int)fs.Length);
                imageTarget.Bytes = new MemoryStream(data);
            }
        }
        catch (Exception)
        {
            Console.WriteLine("Failed to load target image: " + targetImage);
            return "Failed to load target image: " + targetImage;
        }

        CompareFacesRequest compareFacesRequest = new CompareFacesRequest()
        {
            SourceImage = imageSource,
            TargetImage = imageTarget,
            SimilarityThreshold = similarityThreshold
        };

        // Call operation
        CompareFacesResponse compareFacesResponse = rekognitionClient.CompareFaces(compareFacesRequest);

        // Display results
        foreach (CompareFacesMatch match in compareFacesResponse.FaceMatches)
        {
            ComparedFace face = match.Face;
            BoundingBox position = face.BoundingBox;
            Console.WriteLine("Face at " + position.Left
                  + " " + position.Top
                  + " matches with " + match.Similarity
                  + "% confidence.");
            result = "Face at " + position.Left
                  + " " + position.Top
                  + " matches with " + match.Similarity
                  + "% confidence.";
        }

        //Console.WriteLine("There was " + compareFacesResponse.UnmatchedFaces.Count + " face(s) that did not match");
        //result = "There was " + compareFacesResponse.UnmatchedFaces.Count + " face(s) that did not match";
        return result;
    }
}