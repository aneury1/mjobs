class GitHubJob {
  String id;
  String type;
  String url;
  String created_at;
  String company;
  String company_url;
  String location;
  String title;
  String description;
  String how_to_apply;
  String company_logo;

  GitHubJob(
      {this.id,
      this.type,
      this.url,
      this.created_at,
      this.company,
      this.company_url,
      this.location,
      this.title,
      this.description,
      this.how_to_apply,
      this.company_logo});

      GitHubJob.empty();

  factory GitHubJob.fromJson(Map<String, dynamic> json) {
   
    return GitHubJob(
      id: json['id'],
      type: json['type'],
      url: json['url'],
      created_at: json['create_at'],
      company: json['company'],
      company_url: json['company_url'],
      location: json['location'],
      title: json['title'],
      description: json['description'],
      how_to_apply: json['how_to_apply'],
      company_logo: json['company_logo'],
    );
  }
}
