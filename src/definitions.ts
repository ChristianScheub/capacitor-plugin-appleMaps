export interface appleMapsSdkPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
