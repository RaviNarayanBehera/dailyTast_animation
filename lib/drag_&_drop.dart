import 'package:flutter/material.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  bool puzzleCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Word Puzzle',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildDragTargets(),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Hint'),
                          content: const Text('FLUTTER'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.error_outline),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildDraggableImages(),
              const SizedBox(
                height: 50,
              ),
              const Divider(color: Colors.black,),
              const SizedBox(
                height: 50,
              ),
              buildDragTarget(),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Hint'),
                          content: const Text('ANDROID'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.error_outline),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildDraggableImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDragTargets() {
    return Center(
      child: Row(
        children: List.generate(name.length, (index) {
          return DragTarget<String>(
            onAcceptWithDetails: (details) {
              setState(() {
                if (!puzzleCompleted && details.data == imagesTarget[index]) {
                  targetImage[index] = true;
                  draggableImages.remove(details.data);
                  checkPuzzleCompletion();
                } else if (!puzzleCompleted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Row(
                        children: [
                          Icon(Icons.error, color: Colors.white),
                          SizedBox(width: 8),
                          Text('Wrong match! Try again.',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                alignment: Alignment.center,
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2)),
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: (targetImage[index])
                    ? Image.network(imagesTarget[index], fit: BoxFit.cover)
                    : Text(name[index],
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold)),
              );
            },
          );
        }),
      ),
    );
  }

  Widget buildDragTarget() {
    return Center(
      child: Row(
        children: List.generate(name2.length, (index) {
          return DragTarget<String>(
            onAcceptWithDetails: (details) {
              setState(() {
                if (!puzzleCompleted && details.data == imagesTarget2[index]) {
                  targetImage2[index] = true;
                  draggableImages2.remove(details.data);
                  checkPuzzleCompletion();
                } else if (!puzzleCompleted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Row(
                        children: [
                          Icon(Icons.error, color: Colors.white),
                          SizedBox(width: 8),
                          Text('Wrong match! Try again.',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                alignment: Alignment.center,
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2)),
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: (targetImage2[index])
                    ? Image.network(imagesTarget2[index], fit: BoxFit.cover)
                    : Text(name2[index],
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold)),
              );
            },
          );
        }),
      ),
    );
  }

  Widget buildDraggableImages() {
    return Row(
      children: List.generate(draggableImages.length, (index) {
        return Draggable<String>(
          data: draggableImages[index],
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(draggableImages[index]),
                    fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2)),
                ],
              ),
            ),
          ),
          childWhenDragging: Container(),
          child: (puzzleCompleted)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(draggableImages[index]),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2)),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }

  Widget buildDraggableImage() {
    return Row(
      children: List.generate(draggableImages2.length, (index) {
        return Draggable<String>(
          data: draggableImages2[index],
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              height: 50.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(draggableImages2[index]),
                    fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2)),
                ],
              ),
            ),
          ),
          childWhenDragging: Container(),
          child: (puzzleCompleted)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(draggableImages2[index]),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2)),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }

  void checkPuzzleCompletion() {
    if (!targetImage2.contains(false)) {
      setState(() {
        puzzleCompleted = true;
      });
      showPuzzleCompletedDialog();
    }
  }

  void showPuzzleCompletedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text('The puzzle is solved successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK', style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),
    );
  }
}

List<String> name = ['_', '_', '_', '_', '_', '_', '_'];
List<String> name2 = ['_', '_', '_', '_', '_', '_', '_'];
List<String> imagesTarget = [
  'https://i.pinimg.com/originals/eb/2c/76/eb2c7602cbd34152143fa0a9fee771d6.png',
  // F
  'https://i5.walmartimages.com/seo/Alphabet-Letter-L-Color-Black-2-Block-Style-Iron-On-Embroidered-Applique-Patch_cef78e8c-e0d2-4a8b-adba-ea0260c91d88.d4541c5cf719f108954c5190c9257692.jpeg',
  // L
  'https://i.pinimg.com/originals/15/fe/d4/15fed44d0cae6aba7a310fd601a93744.png',
  // U
  'https://i.pinimg.com/736x/46/d5/88/46d588dc3195dc7fda7bca00389b99ff.jpg',
  // T
  'https://i.pinimg.com/736x/46/d5/88/46d588dc3195dc7fda7bca00389b99ff.jpg',
  // T
  'https://i.pinimg.com/originals/0e/5f/57/0e5f5791d9e4a022a3cfb632f3963199.png',
  // E
  'https://i.pinimg.com/736x/9f/6f/0d/9f6f0df5b26ddab4258cc55d2f3529c1.jpg',
  // R
];
List<String> imagesTarget2 = [
  'https://i.pinimg.com/736x/e0/69/5f/e0695fd151ca5a63195a14d47591b862.jpg',
  // A
  'https://i.pinimg.com/originals/60/f1/5c/60f15ceb09615176cd11267ae445fc0b.png',
  // N
  'https://i.pinimg.com/736x/50/f2/26/50f2261e4e3a97bf5a5f58af5ec2f845.jpg',
  // D
  'https://i.pinimg.com/736x/9f/6f/0d/9f6f0df5b26ddab4258cc55d2f3529c1.jpg',
  // R
  'https://i.pinimg.com/originals/fc/d7/90/fcd7906e849c123200403029056612fe.png',
  // O
  'https://i.pinimg.com/736x/4a/d7/9a/4ad79aa01e9bba788cd35453a9325fa0.jpg',
  // I
  'https://i.pinimg.com/736x/50/f2/26/50f2261e4e3a97bf5a5f58af5ec2f845.jpg',
  // D
];

List<bool> targetImage = [false, false, false, false, false, false, false];
List<bool> targetImage2 = [false, false, false, false, false, false, false];

List<String> images = [
  'https://i5.walmartimages.com/seo/Alphabet-Letter-L-Color-Black-2-Block-Style-Iron-On-Embroidered-Applique-Patch_cef78e8c-e0d2-4a8b-adba-ea0260c91d88.d4541c5cf719f108954c5190c9257692.jpeg',
  'https://i.pinimg.com/736x/46/d5/88/46d588dc3195dc7fda7bca00389b99ff.jpg',
  'https://i.pinimg.com/originals/15/fe/d4/15fed44d0cae6aba7a310fd601a93744.png',
  'https://i.pinimg.com/originals/eb/2c/76/eb2c7602cbd34152143fa0a9fee771d6.png',
  'https://i.pinimg.com/736x/9f/6f/0d/9f6f0df5b26ddab4258cc55d2f3529c1.jpg',
  'https://i.pinimg.com/originals/0e/5f/57/0e5f5791d9e4a022a3cfb632f3963199.png',
  'https://i.pinimg.com/736x/46/d5/88/46d588dc3195dc7fda7bca00389b99ff.jpg',
];
List<String> images2 = [
  'https://i.pinimg.com/736x/9f/6f/0d/9f6f0df5b26ddab4258cc55d2f3529c1.jpg',
  'https://i.pinimg.com/736x/50/f2/26/50f2261e4e3a97bf5a5f58af5ec2f845.jpg',
  'https://i.pinimg.com/736x/50/f2/26/50f2261e4e3a97bf5a5f58af5ec2f845.jpg',
  'https://i.pinimg.com/originals/fc/d7/90/fcd7906e849c123200403029056612fe.png',
  'https://i.pinimg.com/originals/60/f1/5c/60f15ceb09615176cd11267ae445fc0b.png',
  'https://i.pinimg.com/736x/4a/d7/9a/4ad79aa01e9bba788cd35453a9325fa0.jpg',
  'https://i.pinimg.com/736x/e0/69/5f/e0695fd151ca5a63195a14d47591b862.jpg',
];

List<String> draggableImages = List.from(images);
List<String> draggableImages2 = List.from(images2);
