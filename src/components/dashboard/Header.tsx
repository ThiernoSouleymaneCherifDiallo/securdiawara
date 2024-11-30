interface HeaderProps {
  onMenuClick?: () => void;
}

export default function DashboardHeader({ onMenuClick }: HeaderProps) {
  return (
    <header className="bg-white shadow">
      <div className="flex items-center justify-between h-16 px-4 md:px-6 lg:px-8">
        <button
          type="button"
          className="lg:hidden p-2 rounded-md text-gray-600 hover:text-gray-900"
          onClick={onMenuClick}
        >
          <span className="sr-only">Ouvrir le menu</span>
          <svg
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            strokeWidth="1.5"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
            />
          </svg>
        </button>

        <div className="flex-1 flex justify-between px-4 md:px-0">
          <div className="flex-1 flex">
            <h1 className="text-2xl font-semibold text-gray-900">
              SecurGuinee Admin
            </h1>
          </div>
          <div className="ml-4 flex items-center md:ml-6">
            {/* Profil dropdown */}
          </div>
        </div>
      </div>
    </header>
  );
} 