# The Boring Show / Replicated!

I find that I learn things better if I do them myself. 

This is an effort to code along with episodes of the [The Boring Show](https://www.youtube.com/playlist?list=PLOU2XLYxmsIK0r_D-zWcmJ1plIcDNnRkK) so I can better understand how to structure/architect complex apps in Flutter.

The Boring Show focuses on building a Hacker News Clone.

As a bonus project, I will use insights from this replication effort to build a similar app for a new data source and/ordomain. This ensures that any knowledge I gain from this exercise does in fact "translate" to new projects.


## Episode 1: The Pilot Episode

1. Scaffolded a blank app. ```flutter create --org flutter.fyi hn_app```


2. Opened an iOS Simulator for testing. ```open -a Simulator```. Verified that scaffolded app worked.

3. Cleaned up boilerplate to reduce to basic screen (with Scaffold, AppBar and center text. No FAB or counter). / _CheckIn 1_

4. Try out hot stateful reload.

5. Create Data object (article.dart) and provide some fixtures (mock data) for initial testing.

6. Update Scaffold body with List of Text widgets mapped from fixtures data. Using ListTile widget. / _CheckIn 2_

7. Refactored to use my own data (countries) as use case instead of news. Helps ensure I learn/apply ideas deliberately vs. blind copy / _CheckIn 3_

8. Added package dependency(url_launcher) in pubspec.yaml. Saved to trigger package get/install. Imported package in main.dart, ready to use.

9. Added "onTap" handler to ListTile view to support actions when item in list is tapped.

10. Learnt about await/async for long-running ops (e.g., url fetching). Updated onTap handler to use url_launcher "launch" which opens given URL in the browser (mobile Safari on iOS, default browser on Android) / _CheckIn 4_

