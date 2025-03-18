part of '../flutter_quran_screen.dart';

class _DefaultDrawer extends StatelessWidget {
  const _DefaultDrawer();

  @override
  Widget build(BuildContext context) {
    final jozzs = FlutterQuran().getAllJozzs();
    final hizbs = FlutterQuran().getAllHizbs();
    final surahs = FlutterQuran().getAllSurahs();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              trailing: const Icon(Icons.search_outlined),
              title: const Text('Search'),
              onTap: () async {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const _FlutterQuranSearchScreen()));
              },
            ),
            ExpansionTile(
              title: const Text('Index'),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  title: const Text('Juz'),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      jozzs.length,
                      (jozzIndex) => GestureDetector(
                          onTap: () => FlutterQuran().navigateToJozz(jozzIndex + 1),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              jozzs[jozzIndex],
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                          ))
                      //    )
                      ),
                ),
                ExpansionTile(
                  title: const Text('Surah'),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      surahs.length,
                      (index) => GestureDetector(
                          onTap: () => FlutterQuran().navigateToSurah(index + 1),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              surahs[index],
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                          ))),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Bookmark'),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: FlutterQuran()
                      .getUsedBookmarks()
                      .map((bookmark) => ListTile(
                            leading: Icon(
                              Icons.bookmark,
                              color: Color(bookmark.colorCode),
                            ),
                            title: Text(
                              bookmark.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            onTap: () =>
                                FlutterQuran().navigateToBookmark(bookmark),
                          ))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
