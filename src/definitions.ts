export interface appleMapsSdkPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  initAppleMaps(): Promise<{ status: string }>;  // Initialization
  showAppleMaps(): Promise<{ status: string }>;  // No parameters anymore
  hideAppleMaps(): Promise<{ status: string }>;  // Make the map invisible
  setValuesAppleMaps(options: { dataPoints: { latitude: number; longitude: number; label: string }[] }): Promise<{ status: string }>;
  setCenterPoint(options: { latitude: number; longitude: number }): Promise<{ status: string }>;
  closeAppleMaps(): Promise<{ status: string }>;  // Close the map
  isAppleMapsVisible(): Promise<{ status: number }>;  // Return value: 0 = not initialized, 1 = invisible, 2 = visible
}