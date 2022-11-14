void jinxInit(void);

__attribute__((constructor)) static void init(void) {
    // Limiting initialisation goes here, i.e., "Don't init if..."
    
    // Start the Swift code-- removing this line will break your tweak
    jinxInit();
    
    // Other initialisation goes here, i.e., "After initialising, do..."
}
