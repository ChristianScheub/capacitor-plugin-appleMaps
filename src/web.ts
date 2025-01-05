import { WebPlugin } from '@capacitor/core';

import type { appleMapsSdkPlugin } from './definitions';

export class appleMapsSdkWeb extends WebPlugin implements appleMapsSdkPlugin {
  initAppleMaps(): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  closeAppleMaps(): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  isAppleMapsVisible(): Promise<{ status: number; }> {
    throw new Error('Method not implemented.');
  }
  showAppleMaps(): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  hideAppleMaps(): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  setValuesAppleMaps(options: { dataPoints: { latitude: number; longitude: number; label: string; }[]; }): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  setCenterPoint(options: { latitude: number; longitude: number; }): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  closeAppleMap(): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async showAppleMap(options: { latitude: number, longitude: number }): Promise<{ status: string }> {
    console.log(`Apple Map Show Placeholder - Latitude: ${options.latitude}, Longitude: ${options.longitude}`);
    return { status: "Apple Map (Web Version) - No native map shown" };
  }
}
