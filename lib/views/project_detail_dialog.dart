import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/project.dart';
import '../widgets/common/tag_chip.dart';
import '../widgets/mockup/goldie_device_mockup.dart';

class ProjectDetailDialog extends StatefulWidget {
  final Project project;

  const ProjectDetailDialog({super.key, required this.project});

  @override
  State<ProjectDetailDialog> createState() => _ProjectDetailDialogState();
}

class _ProjectDetailDialogState extends State<ProjectDetailDialog> {
  late final PageController _pageController = PageController();
  int _page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final allImages = [widget.project.image, ...widget.project.gallery];

    return Dialog(
      backgroundColor: AppColors.panel,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.border),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 980, maxHeight: 820),
        child: LayoutBuilder(
          builder: (context, box) {
            final compact = box.maxWidth < 720;

            final galleryWidget = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF091722),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: allImages.length,
                          onPageChanged: (index) => setState(() => _page = index),
                          itemBuilder: (context, index) {
                            return Center(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GoldieDeviceMockup(
                                    imagePath: allImages[index],
                                    width: compact ? 210 : 240,
                                    height: compact ? 420 : 480,
                                    enableHoverEffect: false,
                                    badgeText: index == 0
                                        ? 'App Store & Play Store'
                                        : 'Screen ${index + 1} of ${allImages.length}',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Left Arrow Button
                      if (_page > 0)
                        Positioned(
                          left: 12,
                          child: Material(
                            color: Colors.black54,
                            shape: const CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              icon: const Icon(
                                Icons.chevron_left_rounded,
                                color: AppColors.lime,
                                size: 28,
                              ),
                              tooltip: 'Previous Screen',
                              onPressed: _previousPage,
                            ),
                          ),
                        ),

                      // Right Arrow Button
                      if (_page < allImages.length - 1)
                        Positioned(
                          right: 12,
                          child: Material(
                            color: Colors.black54,
                            shape: const CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              icon: const Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.lime,
                                size: 28,
                              ),
                              tooltip: 'Next Screen',
                              onPressed: _nextPage,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Indicator Dots and Screen Counter
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_page + 1} / ${allImages.length}',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        allImages.length,
                        (index) => GestureDetector(
                          onTap: () => _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutCubic,
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: _page == index ? 22 : 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: _page == index
                                  ? AppColors.lime
                                  : Colors.white24,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );

            final infoWidget = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagChip(widget.project.category),
                const SizedBox(height: 16),
                Text(
                  widget.project.name,
                  style: const TextStyle(
                    color: AppColors.paper,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.8,
                  ),
                ),
                if (widget.project.headline != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    widget.project.headline!,
                    style: const TextStyle(
                      color: AppColors.lime,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                if (widget.project.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.project.subtitle!,
                    style: const TextStyle(
                      color: AppColors.cyan,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Text(
                  widget.project.description,
                  style: const TextStyle(
                    color: AppColors.muted,
                    height: 1.8,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'TECHNOLOGY STACK',
                  style: TextStyle(
                    color: AppColors.lime,
                    fontSize: 10,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.tags
                      .map((tag) => TagChip(tag))
                      .toList(),
                ),
              ],
            );

            return Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'SOFTWARE MANSION GOLDIE · APP STORE CASE STUDY',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 10,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: compact
                        ? Column(
                            children: [
                              Expanded(flex: 6, child: galleryWidget),
                              const SizedBox(height: 20),
                              Expanded(
                                flex: 4,
                                child: SingleChildScrollView(child: infoWidget),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(flex: 6, child: galleryWidget),
                              const SizedBox(width: 28),
                              Expanded(
                                flex: 4,
                                child: SingleChildScrollView(child: infoWidget),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
