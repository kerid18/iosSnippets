// Use POST to submit a form
// 
//
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: 51413028-C45F-459D-81F8-F958C28F6749
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
/*
 CODE RESEARCH:
 TOPIC: Use POST to submit a form
 URL:http://stackoverflow.com/questions/2699259/iphone-development-use-post-to-submit-a-form
 
 CODE:
 <form method="post" action="http://shk.ecomd.de/up.php" enctype="multipart/form-data">
 <input type="hidden" name="id" value="12345" />
 <input type="file" name="pic" />
 <input type="submit" />
 </form>

 - (void)sendfile {
 UIImage *tempImage = [UIImage imageNamed:@"image.jpg"];
 
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
 [request setHTTPMethod:@"POST"];
 [request setURL:[NSURL URLWithString:@"http://url..../form.php"]];
 
 
 NSString *boundary = @"------------0xKhTmLbOuNdArY";
 NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
 [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
 
 
 
 NSMutableData *body = [NSMutableData data];
 [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
 [body appendData:[@"Content-Disposition: form-data; name=\"id\"\r\n\r\n" dataUsingEncoding:NSASCIIStringEncoding]];
 [body appendData:[@"12345" dataUsingEncoding:NSUTF8StringEncoding]];
 [body appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
 
 [body appendData:[@"Content-Disposition: form-data; name=\"pic\"; filename=\"photo.png\"\r\n" dataUsingEncoding:NSASCIIStringEncoding]];
 [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSASCIIStringEncoding]];
 [body appendData:[NSData dataWithData:UIImageJPEGRepresentation(tempImage, 90)]];
 
 [body appendData:[[NSString stringWithFormat:@"\r\n%@",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
 // setting the body of the post to the reqeust
 [request setHTTPBody:body];
 
 //add terminating boundary marker
 [body appendData:[[NSString stringWithFormat:@"\r\n%@--",boundary] dataUsingEncoding:NSASCIIStringEncoding]];
 
 NSError *error;
 NSURLResponse *response;
 NSData* result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
 
 NSString* aStr = [[[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding] autorelease];
 
 NSLog(@"Result: %@", aStr);
 
 [request release];    
 }

 
 
 */