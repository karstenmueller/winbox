# Cookbook Name:: winbox
#
# Copyright 2015, Adam Edwards
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class ExecutableFinder
  def self.FindExecutableDirectory(executable)
    executable_path = (`powershell -nologo -noninteractive -noprofile -command "($result = get-command #{executable}) *>&1 | out-null ; if ($?) { $result.path } else { '' }"`).chomp

    result = nil

    if executable_path && executable_path.length > 0
      result = ::File.split(executable_path)[0]
    end

    result
  end
end
