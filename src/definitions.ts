export interface appleMapsSdkPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  initAppleMaps(): Promise<{ status: string }>;  // Initialisierung
  showAppleMaps(): Promise<{ status: string }>;  // Keine Parameter mehr
  hideAppleMaps(): Promise<{ status: string }>;  // Karte unsichtbar machen
  setValuesAppleMaps(options: { dataPoints: { latitude: number; longitude: number; label: string }[] }): Promise<{ status: string }>;
  setCenterPoint(options: { latitude: number; longitude: number }): Promise<{ status: string }>;
  closeAppleMaps(): Promise<{ status: string }>;  // Karte schließen
  isAppleMapsVisible(): Promise<{ status: number }>;  // Rückgabewert: 0 = nicht initialisiert, 1 = unsichtbar, 2 = sichtbar
}
