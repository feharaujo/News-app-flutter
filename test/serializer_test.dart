import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/model/response.dart';

void main() {
  final topHeadLinesJson = r'''{
	"status": "ok",
	"totalResults": 757,
	"articles": [{
			"source": {
				"id": "news-com-au",
				"name": "News.com.au"
			},
			"author": "https://www.news.com.au/national/rush-hour/rush-hour-wife-shames-cheating-husband-with-message-on-mattress/live-coverage/ace077742ec4b267c17c3a1d920cfe2c",
			"title": "RUSH HOUR: Wife shames cheating husband with message on mattress",
			"description": "Welcome to Rush Hour!",
			"url": "https://www.news.com.au/national/rush-hour/rush-hour-wife-shames-cheating-husband-with-message-on-mattress/live-coverage/ace077742ec4b267c17c3a1d920cfe2c",
			"urlToImage": "https://content.api.news/v3/images/bin/e4a002c41083b519d269400b4cb1abc5",
			"publishedAt": "2020-02-19T05:45:54Z",
			"content": "A woman has kicked out her cheating husband by spray-painting a brutal message on their marital bed and dumping it outside.\r\nA photo of the defaced mattress was shared on Reddit on Monday, with the caption, \"Let's bring the kids in to this\". \r\nPicture: kassin… [+871 chars]"
		},
		{
			"source": {
				"id": "espn-cric-info",
				"name": "ESPN Cric Info"
			},
			"author": null,
			"title": "'In the back of your mind you know what's to come' - Rachael Haynes on Australia's journey",
			"description": "Australia's vice captain talks about team culture, bringing in young players and her own form | ESPNcricinfo.com",
			"url": "http://www.espncricinfo.com/story/_/id/28725300/in-back-your-mind-know-come-rachael-haynes-australia-journey",
			"urlToImage": "https://a4.espncdn.com/combiner/i?img=%2Fi%2Fcricket%2Fcricinfo%2F1214368_1296x729.jpg",
			"publishedAt": "2020-02-18T22:29:08Z",
			"content": "November 29, 2018\r\nAustralia's women are the T20 World Cup champions. They scooped the trophy in the Caribbean and flew home in time for a public event at Melbourne Federation Square, a rare ray of light in what is otherwise known as the summer of bans for St… [+12223 chars]"
		},
		{
			"source": {
				"id": "business-insider",
				"name": "Business Insider"
			},
			"author": "Gwen Everett",
			"title": "Here's why one Wall Street firm says coronavirus will be much more difficult for China to overcome than SARS",
			"description": "Here's why one Wall Street firm says coronavirus will be much more difficult for China to overcome than SARS",
			"url": "https://markets.businessinsider.com/news/stocks/coronavirus-recovery-harder-sars-china-economy-challenge-nomura-richard-koo-2020-2-1028915630",
			"urlToImage": "https://images.markets.businessinsider.com/image/5e4c308d4b661b0afb31bd8a-2400/2020-02-18t013743z1lynxmpeg1h02grtroptp4china-health.jpg",
			"publishedAt": "2020-02-18T21:00:07Z",
			"content": "Reuters\r\n<ul><li>China may have a rocky recovery from coronavirus, according to Nomura economist Richard Koo.</li><li>Key parts of the economy that supported recovery after SARS, such as a growing labor force and corporate investment, may be lacking today, he… [+1848 chars]"
		},
		{
			"source": {
				"id": "business-insider-uk",
				"name": "Business Insider (UK)"
			},
			"author": "Gwen Everett",
			"title": "Here's why one Wall Street firm says coronavirus will be much more difficult for China to overcome than SARS",
			"description": "Here's why one Wall Street firm says coronavirus will be much more difficult for China to overcome than SARS",
			"url": "https://markets.businessinsider.com/news/stocks/coronavirus-recovery-harder-sars-china-economy-challenge-nomura-richard-koo-2020-2-1028915630",
			"urlToImage": "https://images.markets.businessinsider.com/image/5e4c308d4b661b0afb31bd8a-2400/2020-02-18t013743z1lynxmpeg1h02grtroptp4china-health.jpg",
			"publishedAt": "2020-02-18T21:00:07Z",
			"content": "Reuters\r\n<ul><li>China may have a rocky recovery from coronavirus, according to Nomura economist Richard Koo.</li><li>Key parts of the economy that supported recovery after SARS, such as a growing labor force and corporate investment, may be lacking today, he… [+1848 chars]"
		},
		{
			"source": {
				"id": "hacker-news",
				"name": "Hacker News"
			},
			"author": null,
			"title": "LaTeX Handwritten Symbol Recognition",
			"description": "An approach to simplify finding LaTeX symbols.",
			"url": "http://detexify.kirelabs.org/classify.html",
			"urlToImage": null,
			"publishedAt": "2020-02-18T20:08:36.0368381Z",
			"content": null
		},
		{
			"source": {
				"id": "cbc-news",
				"name": "CBC News"
			},
			"author": "CBC News",
			"title": "CRTC hearings could open door to mobile disrupters — and possibly cheaper cellphone rates | CBC News",
			"description": "Canadians love to talk about their cellphone bills, and today Canada's telecommunications regulator will jump into that conversation as it launches nine days of hearings.",
			"url": "http://www.cbc.ca/news/politics/crtc-hearings-wireless-mobile-competition-1.5462547",
			"urlToImage": "https://i.cbc.ca/1.5185521.1581974833!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_620/afp-12z1az.jpg",
			"publishedAt": "2020-02-18T20:08:34.6194796Z",
			"content": "Canadians love to talk about their cellphone bills, and today the country's telecommunications regulator will jump into that conversation as it launches nine days of hearings.\r\nThe Canadian Radio-Television and Telecommunications Commission (CRTC) hearings ar… [+4605 chars]"
		},
		{
			"source": {
				"id": "buzzfeed",
				"name": "Buzzfeed"
			},
			"author": "Ryan Schocket",
			"title": "16 Hilarious Gay Tweets From This Week",
			"description": "Answering a message five years late is gay culture.",
			"url": "https://www.buzzfeed.com/ryanschocket2/gay-tweets-from-this-week-feb-eighteen",
			"urlToImage": "https://img.buzzfeed.com/buzzfeed-static/static/2020-02/18/18/enhanced/e2072892be8b/original-1435-1582051636-3.jpg?crop=1243:650;5,180",
			"publishedAt": "2020-02-18T20:08:21.006424Z",
			"content": null
		},
		{
			"source": {
				"id": "bbc-sport",
				"name": "BBC Sport"
			},
			"author": "BBC Sport",
			"title": "'The stairs broke' - Mourinho's unusual reaction to Son injury",
			"description": "Tottenham Hotspur manager Jose Mourinho gives a unusual stairway analogy when asked about Son Heung-min's arm injury.",
			"url": "http://www.bbc.co.uk/sport/av/football/51551111",
			"urlToImage": "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/17CE1/production/_110950579_p083t5zf.jpg",
			"publishedAt": "2020-02-18T20:08:08.5324601Z",
			"content": null
		},
		{
			"source": {
				"id": "hacker-news",
				"name": "Hacker News"
			},
			"author": "amzn",
			"title": "amzn/computer-vision-basics-in-microsoft-excel",
			"description": "Computer Vision Basics in Microsoft Excel (using just formulas) - amzn/computer-vision-basics-in-microsoft-excel",
			"url": "https://github.com/amzn/computer-vision-basics-in-microsoft-excel",
			"urlToImage": "https://avatars2.githubusercontent.com/u/8594673?s=400&v=4",
			"publishedAt": "2020-02-18T20:08:08.2061463Z",
			"content": "By Alok Govil, Principal Engineer, Amazon\r\nCollaborator: Venkataramanan Subramanian, Principal Engineer, Amazon\r\nComputer Vision is often seen by software developers and others as a hard field to get into. In this article, we'll learn Computer Vision from bas… [+11962 chars]"
		},
		{
			"source": {
				"id": "cbc-news",
				"name": "CBC News"
			},
			"author": "CBC News",
			"title": "Indigenous leaders say way to end blockades is through respectful dialogue | CBC News",
			"description": "Assembly of First Nations Chief Perry Bellegarde relays three Wet'suwet'en requests to help establish a new relationship with the Crown.",
			"url": "http://www.cbc.ca/news/canada/indigenous-leaders-say-way-to-end-blockades-is-through-respectful-dialogue-1.5467191",
			"urlToImage": "https://i.cbc.ca/1.5467191.1582046402!/httpImage/image.JPG_gen/derivatives/16x9_620/image.JPG",
			"publishedAt": "2020-02-18T20:08:07.8798337Z",
			"content": null
		},
		{
			"source": {
				"id": "cnn",
				"name": "CNN"
			},
			"author": null,
			"title": "CNNgo - CNN.com",
			"description": "CNNgo is a revolutionary news-watching experience that offers the live CNN broadcast with unprecedented features. You can catch-up on the stories you‘ve missed, go deeper and learn more about the stories that interest you with related coverage, and enjoy the …",
			"url": "http://cnn.it/go2",
			"urlToImage": "//i.cdn.turner.com/cnn/.e/img/4.0/cnngo/cnngo_social.png",
			"publishedAt": "2020-02-18T20:07:57.5999745Z",
			"content": null
		},
		{
			"source": {
				"id": "polygon",
				"name": "Polygon"
			},
			"author": "Michael McWhertor",
			"title": "Xbox Game Pass Feb. 2020 games announced: Yakuza 0, Kingdom Hearts 3",
			"description": "Everything coming to Xbox Game Pass on console and PC for the remainder of February 2020.",
			"url": "https://www.polygon.com/2020/2/18/21142712/xbox-game-pass-february-2020-updates-additions",
			"urlToImage": "https://cdn.vox-cdn.com/thumbor/2cAyUukmniG7oV9tCwkvxc36d2Y=/0x0:1280x670/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/19727859/PREVIEW_SCREENSHOT6_126745.jpg",
			"publishedAt": "2020-02-18T20:02:48Z",
			"content": "Xbox Game Pass subscribers will get access to games like Ninja Gaiden 2, Kingdom Hearts 3, and Yakuza 0 on console as part of the subscription this month. Those titles join recently added games like Wolfenstein: Youngbloodand Final Fantasy 15 on Xbox One with… [+1517 chars]"
		},
		{
			"source": {
				"id": "techcrunch",
				"name": "TechCrunch"
			},
			"author": "Lucas Matney",
			"title": "Patreon enters the micro-lending game with Patreon Capital",
			"description": "Patreon, a platform for creators to earn monetary support from fans, is busting out the checkbook. The startup isn’t playing VC quite yet with newly-launched Patreon Capital but they are hocking non-equity cash advances (loans!) for Patreon customers in need …",
			"url": "https://techcrunch.com/2020/02/18/patreon-enters-the-micro-lending-game-with-patreon-capital/",
			"urlToImage": "https://techcrunch.com/wp-content/uploads/2019/03/patreon-money-large.png?w=753",
			"publishedAt": "2020-02-18T20:01:11Z",
			"content": "Patreon, a platform for creators to earn monetary support from fans, is busting out the checkbook. The startup isn’t playing VC quite yet with newly-launched Patreon Capital but they are hocking non-equity cash advances (loans!) for Patreon customers in need … [+1920 chars]"
		},
		{
			"source": {
				"id": "cbs-news",
				"name": "CBS News"
			},
			"author": "CBS News",
			"title": "The Plot to Kill Dr. Sievers",
			"description": "Did a Florida man hire a look-a-like to kill his wife?  A GPS leads police right to the hitman’s door.  \"48 Hours\" correspondent Erin Moriarty reports.",
			"url": "https://www.cbsnews.com/video/the-plot-to-kill-dr-sievers/",
			"urlToImage": "https://cbsnews1.cbsistatic.com/hub/i/r/2020/02/16/880316ef-d4e5-4b71-ae0a-1b68ebb08d2f/thumbnail/1200x630/e17fb84219512e4b6a5f21b3f5d93df1/sievers-full-2027970-640x360.jpg",
			"publishedAt": "2020-02-18T19:59:03+00:00",
			"content": "Did a Florida man hire a look-a-like to kill his wife?  A GPS leads police right to the hitman’s door.  \"48 Hours\" correspondent Erin Moriarty reports."
		},
		{
			"source": {
				"id": "financial-post",
				"name": "Financial Post"
			},
			"author": "Geoff Zochodne",
			"title": "Mortgage stress test changes coming, Morneau announces, in move that may make buying a home easier",
			"description": "Changes that take effect on April 6 aimed at adjusting the benchmark rate",
			"url": "https://business.financialpost.com/real-estate/mortgages/mortgage-stress-test-changes-coming-morneau-announces-in-move-that-may-make-buying-a-home-easier?video_autoplay=true",
			"urlToImage": "https://financialpostcom.files.wordpress.com/2020/02/sold.jpg",
			"publishedAt": "2020-02-18T19:58:31Z",
			"content": "Ottawa and a federal banking regulator are planning to introduce changes to the mortgage stress tests by April, a move which could make it potentially easier for would-be homebuyers to get mortgages.\r\nFinance Minister Bill Morneau and the Office of the Superi… [+2584 chars]"
		},
		{
			"source": {
				"id": "associated-press",
				"name": "Associated Press"
			},
			"author": "MARK LONG",
			"title": "Blaney's attempted push of Newman led to violent crash ",
			"description": "DAYTONA BEACH, Fla. (AP) — Drafting, blocking and bumping are essential elements of racing on NASCAR's fastest tracks. When Ryan Blaney pushed fellow Ford driver Ryan Newman in the final lap of...",
			"url": "https://apnews.com/c91539b42d85151082831f0f3ac28a9a",
			"urlToImage": "https://storage.googleapis.com/afs-prod/media/3edecbe5813c41afadbff1229fb9df29/3000.jpeg",
			"publishedAt": "2020-02-18T19:58:30Z",
			"content": null
		},
		{
			"source": {
				"id": "cbs-news",
				"name": "CBS News"
			},
			"author": "CBS News",
			"title": "6 Democratic candidates qualify for Nevada debate",
			"description": "The event Wednesday night marks the final debate before Nevada caucus-goers pick their candidates February 22.",
			"url": "https://www.cbsnews.com/video/6-democratic-candidates-qualify-for-nevada-debate/",
			"urlToImage": "https://cbsnews1.cbsistatic.com/hub/i/r/2020/02/18/4c1163e3-d05e-418d-9be9-e448f085e056/thumbnail/1200x630/8880d6af2a2c42889d30ac2612b1d13a/0218-cbsn-social-qualifiednevadademdeb-2029642-640x360.jpg",
			"publishedAt": "2020-02-18T19:58:03+00:00",
			"content": "The event Wednesday night marks the final debate before Nevada caucus-goers pick their candidates February 22."
		},
		{
			"source": {
				"id": "cbs-news",
				"name": "CBS News"
			},
			"author": "Clare Hymes",
			"title": "Amy Berman Jackson, judge in Roger Stone case, says sentencing will move forward as planned",
			"description": "Judge Amy Berman Jackson said she will still hand down Stone's sentence on Thursday, but indicated she plans to defer the execution of the sentence.",
			"url": "https://www.cbsnews.com/news/roger-stone-amy-berman-jackson-sentencing-thursday-planned/",
			"urlToImage": "https://cbsnews2.cbsistatic.com/hub/i/r/2019/11/15/d50063fd-1a97-4d11-bede-67d30aeb4d9e/thumbnail/1200x630/265b89e83a02e6650ab917ade9590248/ap-19319631440573.jpg",
			"publishedAt": "2020-02-18T19:57:55+00:00",
			"content": "Washington — The judge overseeing the case of longtime Trump confidant Roger Stone said his sentencing hearing will move forward as planned on Thursday, amid intense scrutiny of the Justice Department's handling of the case.\r\nIn a 12-minute conference call wi… [+3695 chars]"
		},
		{
			"source": {
				"id": "reuters",
				"name": "Reuters"
			},
			"author": "Reuters Editorial",
			"title": "Trump says he knows identity of author known as 'Anonymous'",
			"description": "U.S. President Donald Trump said on Tuesday that he knew the identity of an anonymous Trump administration official who wrote an essay for the New York Times and later a book about efforts from within to thwart parts of the president's agenda to protect the c…",
			"url": "http://feeds.reuters.com/~r/reuters/topNews/~3/P5gErMdgSqQ/trump-says-he-knows-identity-of-author-known-as-anonymous-idUSKBN20C2H3",
			"urlToImage": "https://s4.reutersmedia.net/resources/r/?m=02&d=20200218&t=2&i=1492066480&w=1200&r=LYNXMPEG1H1FV",
			"publishedAt": "2020-02-18T19:56:45Z",
			"content": "WASHINGTON (Reuters) - U.S. President Donald Trump said on Tuesday that he knew the identity of an anonymous Trump administration official who wrote an essay for the New York Times and later a book about efforts from within to thwart parts of the president’s … [+1284 chars]"
		},
		{
			"source": {
				"id": "news-com-au",
				"name": "News.com.au"
			},
			"author": "Gavin Fernando and Sarah McPhee",
			"title": "Sydney, Melbourne weather: Severe storms, hail in Wollongong",
			"description": "Severe thunderstorms that battered NSW overnight set to continue",
			"url": "https://www.news.com.au/technology/environment/severe-thunderstorms-that-battered-nsw-overnight-set-to-continue/news-story/667e95efd3439e1f4316b7cbd5a7b3c8",
			"urlToImage": "https://cdn.newsapi.com.au/image/v1/ad4243a67734a8a98ce2b1f841b3a675?width=650",
			"publishedAt": "2020-02-18T19:55:00Z",
			"content": "Severe deadly thunderstorms that battered New South Wales overnight and saw a man killed will continue to strike this morning.Thunderstorms felled trees and caused power outages across Sydney last night as damaging winds and large hailstones battered the cent… [+3797 chars]"
		}
	]
}''';

  test("deserialize top-headlines with success", () {
    var response = Response.fromJson(topHeadLinesJson);
    expect(response.articles.length, 20);
    expect(response.status, "ok");
  });
}
