part of '../root_screen.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: Platform.isAndroid ? 72 : 90,
      padding: Platform.isAndroid
          ? const EdgeInsets.symmetric(horizontal: 16)
          : const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Consumer<RootScreenVM>(
        builder: (context, vm, child) => Row(
          children: [
            _NavBarItem(
              index: 0,
              icon: vm.activeIndex == 0
                  ? const Icon(Icons.dashboard)
                  : const Icon(Icons.dashboard_outlined),
              label: context.locale?.library ?? '',
            ),
            _NavBarItem(
              index: 1,
              icon: vm.activeIndex == 1
                  ? const Icon(Icons.person_2)
                  : const Icon(Icons.person_2_outlined),
              label: context.locale?.profile ?? '',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final int index;
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.read<RootScreenVM>().changeScreen(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 4),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
