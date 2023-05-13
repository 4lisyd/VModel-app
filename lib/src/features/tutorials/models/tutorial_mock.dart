import 'package:vmodel/src/res/icons.dart';

class HelpSupportModel {
  final String? title;
  final String? body;
  final String? iconPath;
  final Map<int, String>? accountSettings;
  HelpSupportModel(
      {this.title, this.body, this.iconPath, this.accountSettings});

  static List<HelpSupportModel> popularFAQS() {
    return [
      HelpSupportModel(
        title: "How can I set up my account?",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "Change or reset your password",
          body: """
        <p>Follow these steps to change your password in the app:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Open the app and navigate to the main menu.</li>
          <li>Click on <b>Settings</b></li>
          <li>Scroll down and select the <b>Security</b> submenu.</li>
          <li>In the Security menu, select <b>Password Settings.</b></li>
          <li>Follow the on-screen instructions to change your password.</li>
        </ol>
        <p>Note: You may be prompted to enter your current password before changing it. Make sure to choose a strong password that is unique to this app and that you can remember easily.</p>
        <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "Recover your account if you can’t log in.",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "How to create a verified pets profile",
          body: """
        <p>Creating as Pet Profile on VModel</p>
        <p>To create a verified pet profile on VModel, follow these steps:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Sign up for a freelance account on the VModel app with your own personal details.</li>
          <li>During the registration process, you will be prompted to select an account type. Choose <b>Pet Creator</b> as your account type.</li>
          <li>Once you have registered as a Pet Creator, you will need to verify your personal details for security purposes. This also helps us confirm that you are authorised to register the pet.</li>
          <li>Follow the on-screen instructions to complete the verification process. You may be required to provide additional documentation to verify your identity.</li>
          <li>Once your personal details have been verified, you can proceed to create a profile for your pet. Provide all necessary information such as name, age, breed, and any other relevant information.</li>
        </ol>
        <p>Note: At this time, it is not possible to switch any other account type to a pet account on VModel. You will need to create a separate freelance account specifically for your pet. By creating a verified pet profile on VModel, you can connect with other pet creators or businesses who re looking to hire pets.</p>
        <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "How to qualify for your blue badge",
        body:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "How to pause your VModel account ",
          body: """
        <p>How to Pause Your VModel Account</p>
        <p>If you need to take a break from using VModel, you can pause your account. Here's how:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Open the VModel app and navigate to the main menu.</li>
          <li>From the main menu, click on <b>Settings.</b></li>
          <li>In the <b>Settings.</b> menu, select the <b>Accounts</b> submenu.</li>
          <li>In the <b>Accounts</b> submenu, select <b>Pause Account</b>.</li>
          <li>Follow the on-screen instructions to confirm that you want to pause your account.</li>
        </ol>
        <p>Once your account is paused, your profile will not be visible to other users and you will not receive any new booking requests. However, any existing bookings that you have will remain active until their completion date.</p>
        <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "How to close your VModel account",
          body: """
        <p>If you no longer wish to use VModel, you can deactivate your account. Here's how:</p>
        <p>If you need to take a break from using VModel, you can pause your account. Here's how:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Open the VModel app and navigate to the main menu.</li>
          <li>From the main menu, click on <b>Settings.</b></li>
          <li>In the <b>Settings.</b> menu, select the <b>Accounts</b> submenu.</li>
          <li>In the <b>Accounts</b> submenu, select <b>Deactivate Account</b>.</li>
          <li>Follow the on-screen instructions to confirm that you want to deactivate your account.</li>
        </ol>
        <p>Once your account is deactivated, your profile and all of your information will be removed from the VModel app. You will no longer receive any notifications or booking requests from the app. If you decide to use VModel again in the future, you will need to create a new account.</p>
        <p>Note: Before you deactivate your account, make sure that you have completed any outstanding bookings or cancellations. Any active bookings will be cancelled automatically when you deactivate your account.</p>
        <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "How to report something a breach of our terms and conditions",
      body: """
        <p>To report a breach of VModel's terms and conditions, follow these simple steps:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Go to the main menu and click on <b>Settings</b>.</li>
          <li>Select <b>Security</b>.</li>
          <li>Click on <b>Report a User</b></li>
          <li>Provide as much detail as possible about the breach. You may be asked to provide additional information depending on the type of breach.</li>
          <li>Click <b>Submit</b></li>
        </ol>
        <p>Alternatively, you can report a user from their profile. Simply tap on any of their photos and report them from there.</p>
        <p>If the breach is related to content, select the options related to the content and then click <b>Report</b></p>
        <p>It is important to provide as much information as possible when reporting a breach. This will help us keep VModel as safe as possible for everyone. Thank you for your help in making our platform a safe and respectful community.</p>
  <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "How to create a booking (job)",
          body: """
        <p>Creating a booking on VModel is easy. Just follow these simple steps:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Open the VModel app and navigate to the main screen.</li>
          <li>Tap the middle round (VModel) button.</li>
          <li>From the popup menu, select <b>Create a Job</b>.</li>
          <li>Fill out the job details form, which will include:</li>
            <ul>
              <li>Job title and description</li>
              <li>Date and time of the job</li>
              <li>Job location</li>
              <li>Desired pay rate</li>
              <li>Required skills or experience</li>
           </ul>
        </ol>
        <p>Once you've entered all the necessary information, tap <b>Create</b> to submit your job posting.</p>
        <p>Your job will now be visible to all relevant creators on VModel. You'll receive notifications as creators apply for your job, and you can review their profiles and ratings before choosing who to hire.</p>
        <p>Note: Make sure to provide as much detail as possible in your job posting to attract the right creators for your job. And once you've hired someone for your job, make sure to communicate with them promptly and clearly to ensure a successful and smooth booking experience.</p>
  <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "How to create a smart contract",
        body:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "How to get booked by brands",
        body:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "How to get noticed by brands",
          body: """
        <p>Getting booked by brands on VModel requires a combination of talent, professionalism, and strong communication skills. Here are some tips to help you stand out from the competition and increase your chances of landing bookings:</p>
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Maintain Good Work Quality and Delivery: Brands are looking for models who consistently deliver high-quality work. Make sure to always put your best foot forward and exceed their expectations.</li>
          <li>Have a Great Personality: In addition to your modeling skills, brands also want to work with models who have a positive attitude and friendly demeanor. Being personable and easy to work with can go a long way in building lasting relationships with brands.</li>
          <li>Communicate Well: Strong communication skills are essential for success on VModel. Make sure to respond promptly and professionally to messages from brands and keep them updated on any changes or issues that arise.</li>
          <li>Build a Great Portfolio: Your portfolio is your chance to showcase your talent and experience to brands. Make sure to include high-quality photos and a diverse range of work that highlights your unique strengths.</li>
          <li>Keep Your Profile Up-to-Date: Regularly update your VModel profile with your latest work, skills, and experience. This will help brands find you more easily and ensure that your profile accurately reflects your current abilities.</li>
          <li>Ask for Reviews: Reviews from brands you've worked with can help you stand out from other models on VModel. Encourage businesses to leave a review after working with you and make sure to respond to any feedback you receive.</li>
          <li>Create High-Quality Content: To attract brands, make sure that the content on your VModel account is of the highest quality. This includes your photos, videos, and other promotional materials.</li>
          <li>Offer Discounts for Recurring Customers: Building strong relationships with brands can lead to recurring work and steady income. Consider offering discounts or other incentives to encourage brands to book with you again and again.</li>
         
        </ol>
        <p>By following these tips, you can increase your visibility on VModel and attract more bookings from brands looking for talented and professional models.</p>
      <!--You can pretty much put any html in here!-->
"""),
      HelpSupportModel(
        title: "How to compete effectively with other creatives. ",
        body: """
        <ol style="padding: 1px; margin-top:10px" start="1">
          <li>Showcase your strengths: Highlight your unique skills and qualities that set you apart from other creators. This could be your experience, your portfolio, or your ability to work with a diverse range of clients.</li>
          <li>Maintain a professional profile: Keep your profile updated with recent work and ensure that your portfolio is of high quality. This will give you an edge when clients are browsing through different creators' profiles.</li>
          <li>Communicate effectively: Communication is key in any professional relationship, so be sure to respond to messages in a timely manner and provide clear and concise answers to any questions or concerns your clients may have.</li>
          <li>Provide high-quality work: Clients are more likely to re-book you or recommend you to others if they are satisfied with the quality of your work. Focus on delivering top-notch results every time.</li>
          <li>Build relationships: Offering discounts to recurring customers or brands can help build a sense of loyalty and trust, which can lead to more bookings in the long run.</li>
          <li>Get reviews: Encourage clients to leave reviews after working with you. The more positive reviews you have, the more likely you are to stand out from other creators.</li>
          <li>Stay up-to-date: Keep up with the latest trends in your industry and continue to develop your skills. This will not only make you a more valuable asset to clients, but also help you stay ahead of the competition.</li>
        </ol>
  <!--You can pretty much put any html in here!-->
"""
      ),
    ];
  }

  static List<HelpSupportModel> faqTopics() {
    return [
      HelpSupportModel(
        title: "Account setting",
        iconPath: VIcons.accountHelpIcon,
        accountSettings: {
          0: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          1: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          2: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          3: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
        },
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "Login and password",
        iconPath: VIcons.loginHelpIcon,
        accountSettings: {
          0: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          1: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          2: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          3: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
        },
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
      HelpSupportModel(
        title: "Privacy and security",
        iconPath: VIcons.privacyHelpIcon,
        accountSettings: {
          0: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          1: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          2: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
          3: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet",
        },
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      ),
    ];
  }
}
