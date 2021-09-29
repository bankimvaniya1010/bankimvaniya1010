using Amazon.Rekognition;
using Amazon.Rekognition.Model;
using Amazon.Runtime;
using Amazon.Runtime.CredentialManagement;
using Amazon.S3;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DetectFaces
/// </summary>
public class DetectFaces
{
    public string Example(string profileURL)
    {
        string result = string.Empty;


        String photo = profileURL;//"D:/HS_Project/edu_app/Applicationv.01/Docs/webcamCapture/ahs.png";
        String bucket = "mysecondbasket";



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
            }
            rekognitionClient = rekognitionClient = new AmazonRekognitionClient(awsCredentials, basicProfile.Region);
        }

       // AmazonRekognitionClient rekognitionClient = new AmazonRekognitionClient();

        DetectFacesRequest detectFacesRequest = new DetectFacesRequest()
        {
            Image = new Image()
            {
                S3Object = new S3Object()
                {
                    Name = photo,
                    Bucket = bucket
                },
            },
            // Attributes can be "ALL" or "DEFAULT". 
            // "DEFAULT": BoundingBox, Confidence, Landmarks, Pose, and Quality.
            // "ALL": See https://docs.aws.amazon.com/sdkfornet/v3/apidocs/items/Rekognition/TFaceDetail.html
            Attributes = new List<String>() { "ALL" }
        };

        try
        {
            DetectFacesResponse detectFacesResponse = rekognitionClient.DetectFaces(detectFacesRequest);
            bool hasAll = detectFacesRequest.Attributes.Contains("ALL");
            foreach (FaceDetail face in detectFacesResponse.FaceDetails)
            {
                Console.WriteLine("BoundingBox: top={0} left={1} width={2} height={3}", face.BoundingBox.Left,
                    face.BoundingBox.Top, face.BoundingBox.Width, face.BoundingBox.Height);
                Console.WriteLine("Confidence: {0}\nLandmarks: {1}\nPose: pitch={2} roll={3} yaw={4}\nQuality: {5}",
                    face.Confidence, face.Landmarks.Count, face.Pose.Pitch,
                    face.Pose.Roll, face.Pose.Yaw, face.Quality);
                if (hasAll)
                    Console.WriteLine("The detected face is estimated to be between " +
                        face.AgeRange.Low + " and " + face.AgeRange.High + " years old.");
                result = face.Confidence.ToString();
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
        return result;
    }
}